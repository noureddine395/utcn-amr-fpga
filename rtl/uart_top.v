`timescale 1ns/1ps

module seg7(
    input  wire [3:0] digit,
    output reg  [6:0] seg
);
    always @(*) begin
        case (digit)
            4'h0: seg = 7'b1000000;
            4'h1: seg = 7'b1111001;
            4'h2: seg = 7'b0100100;
            4'h3: seg = 7'b0110000;
            4'h4: seg = 7'b0011001;
            4'h5: seg = 7'b0010010;
            4'h6: seg = 7'b0000010;
            4'h7: seg = 7'b1111000;
            4'h8: seg = 7'b0000000;
            4'h9: seg = 7'b0010000;
            4'hA: seg = 7'b0001000;
            4'hB: seg = 7'b0000011;
            4'hC: seg = 7'b1000110;
            4'hD: seg = 7'b0100001;
            4'hE: seg = 7'b0000110;
            4'hF: seg = 7'b0001110;
            default: seg = 7'b1111111;
        endcase
    end
endmodule

module uart_rx #(
    parameter CLK_HZ = 50_000_000,
    parameter BAUD   = 115200
)(
    input  wire       clk, rst_n, rx,
    output reg  [7:0] data,
    output reg        valid
);
    localparam FULL = CLK_HZ / BAUD;
    localparam HALF = FULL / 2;
    localparam IDLE=0, START=1, BITS=2, STOP=3;
    reg [1:0]  st;
    reg [15:0] cnt;
    reg [2:0]  bi;
    reg [7:0]  sh;

    reg rx_meta, rx_sync;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_meta <= 1'b1;
            rx_sync <= 1'b1;
        end else begin
            rx_meta <= rx;
            rx_sync <= rx_meta;
        end
    end

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin st<=IDLE; valid<=0; cnt<=0; bi<=0; sh<=0; data<=0; end
        else begin
            valid<=0;
            case(st)
                IDLE:  if(!rx_sync) begin st<=START; cnt<=0; end
                START: if(cnt==HALF[15:0]) begin
                           if(!rx_sync) begin st<=BITS; cnt<=0; bi<=0; end
                           else st<=IDLE;
                       end else cnt<=cnt+1;
                BITS:  if(cnt==FULL[15:0]-1) begin
                           cnt<=0; sh<={rx_sync,sh[7:1]};
                           if(bi==7) st<=STOP; else bi<=bi+1;
                       end else cnt<=cnt+1;
                STOP:  if(cnt==FULL[15:0]-1) begin
                           cnt<=0; st<=IDLE;
                           if(rx_sync) begin data<=sh; valid<=1; end
                       end else cnt<=cnt+1;
            endcase
        end
    end
endmodule

module uart_tx #(
    parameter CLK_HZ = 50_000_000,
    parameter BAUD   = 115200
)(
    input  wire       clk, rst_n,
    input  wire [7:0] data,
    input  wire       send,
    output reg        tx,
    output wire       busy
);
    localparam FULL = CLK_HZ / BAUD;
    localparam IDLE=0, START=1, BITS=2, STOP=3;
    reg [1:0]  st;
    reg [15:0] cnt;
    reg [2:0]  bi;
    reg [7:0]  sh;
    reg        act;
    assign busy = act;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin st<=IDLE; tx<=1; act<=0; cnt<=0; bi<=0; sh<=0; end
        else begin
            case(st)
                IDLE:  begin tx<=1; act<=0;
                           if(send) begin sh<=data; st<=START; cnt<=0; act<=1; end
                       end
                START: begin tx<=0;
                           if(cnt==FULL[15:0]-1) begin cnt<=0; bi<=0; st<=BITS; end
                           else cnt<=cnt+1;
                       end
                BITS:  begin tx<=sh[0];
                           if(cnt==FULL[15:0]-1) begin
                               cnt<=0; sh<={1'b0,sh[7:1]};
                               if(bi==7) st<=STOP; else bi<=bi+1;
                           end else cnt<=cnt+1;
                       end
                STOP:  begin tx<=1;
                           if(cnt==FULL[15:0]-1) begin cnt<=0; st<=IDLE; act<=0; end
                           else cnt<=cnt+1;
                       end
            endcase
        end
    end
endmodule

module uart_top (
    input  wire        clk,
    input  wire        rst_n,
    input  wire        uart_rx,
    output wire        uart_tx,
    output wire [17:0] ledr,
    output wire [8:0]  ledg,
    output wire [6:0]  hex0,
    output wire [6:0]  hex1,
    output wire [6:0]  hex2,
    output wire [6:0]  hex3,
    output wire [6:0]  hex4,
    output wire [6:0]  hex5
);
    wire [7:0] rx_data;
    wire       rx_valid;
    uart_rx #(.CLK_HZ(50_000_000),.BAUD(115200)) u_rx (
        .clk(clk),.rst_n(rst_n),.rx(uart_rx),
        .data(rx_data),.valid(rx_valid));

    reg  [7:0] tx_data;
    reg        tx_send;
    wire       tx_busy;
    uart_tx #(.CLK_HZ(50_000_000),.BAUD(115200)) u_tx (
        .clk(clk),.rst_n(rst_n),.data(tx_data),.send(tx_send),
        .tx(uart_tx),.busy(tx_busy));

    reg         dut_vin;
    reg  [15:0] dut_sin;
    reg  [7:0]  dut_idx;
    reg         dut_start;
    wire        dut_vout;
    wire [3:0]  dut_cls;
    wire [15:0] dut_score;

    amr_tcn_de2115_v22 dut (
        .clk(clk),.rst_n(rst_n),
        .valid_in(dut_vin),.sample_in(dut_sin),.sample_idx(dut_idx),
        .start_in(dut_start),
        .valid_out(dut_vout),.class_out(dut_cls),.score_out(dut_score));

    reg [3:0]  cls_latch;
    reg [15:0] score_latch;
    reg        done_latch;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin cls_latch<=0; score_latch<=0; done_latch<=0; end
        else if (dut_vout) begin
            cls_latch<=dut_cls; score_latch<=dut_score; done_latch<=1;
        end
    end

    wire [3:0] cls_u = (cls_latch==4'd10) ? 4'd0 : cls_latch;
    wire [3:0] cls_t = (cls_latch==4'd10) ? 4'd1 : 4'd0;
    seg7 u_h0(.digit(cls_u),             .seg(hex0));
    seg7 u_h1(.digit(cls_t),             .seg(hex1));
    seg7 u_h2(.digit(score_latch[3:0]),  .seg(hex2));
    seg7 u_h3(.digit(score_latch[7:4]),  .seg(hex3));
    seg7 u_h4(.digit(score_latch[11:8]), .seg(hex4));
    seg7 u_h5(.digit(score_latch[15:12]),.seg(hex5));

    wire [10:0] onehot = done_latch ? (11'd1 << cls_latch) : 11'd0;
    assign ledr[0]     = done_latch;
    assign ledr[11:1]  = onehot;
    assign ledr[17:12] = 6'b0;
    reg [2:0] rx_st_r;
    assign ledg[2:0] = rx_st_r;
    assign ledg[8:3] = 6'b0;

    localparam SYNC=4'd0, GET_HI=4'd1, UNSTUFF_HI=4'd2,
               GET_LO=4'd3, UNSTUFF_LO=4'd4, PUSH=4'd5,
               WAIT1=4'd6,  WAIT2=4'd7,      WAIT3=4'd8,
               TRIGGER=4'd9;

    reg [3:0]  rx_st;
    reg [8:0]  wcnt;
    reg [7:0]  hi_buf, lo_buf;

    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            rx_st<=SYNC; wcnt<=0; rx_st_r<=0;
            dut_vin<=0; dut_sin<=0; dut_idx<=0; dut_start<=0;
            hi_buf<=0; lo_buf<=0;
        end else begin
            dut_vin   <= 0;
            dut_start <= 0;
            rx_st_r   <= rx_st[2:0];

            case (rx_st)

                SYNC: begin
                    wcnt <= 0;
                    if (rx_valid && rx_data==8'hAA) rx_st<=GET_HI;
                end

                GET_HI: begin
                    if (rx_valid) begin
                        if (rx_data==8'hAB) rx_st<=UNSTUFF_HI;
                        else begin hi_buf<=rx_data; rx_st<=GET_LO; end
                    end
                end
                UNSTUFF_HI: begin
                    if (rx_valid) begin
                        hi_buf <= (rx_data==8'h00) ? 8'hAA : 8'hAB;
                        rx_st  <= GET_LO;
                    end
                end

                GET_LO: begin
                    if (rx_valid) begin
                        if (rx_data==8'hAB) rx_st<=UNSTUFF_LO;
                        else begin lo_buf<=rx_data; rx_st<=PUSH; end
                    end
                end
                UNSTUFF_LO: begin
                    if (rx_valid) begin
                        lo_buf <= (rx_data==8'h00) ? 8'hAA : 8'hAB;
                        rx_st  <= PUSH;
                    end
                end

                PUSH: begin
                    dut_vin  <= 1;
                    dut_idx  <= wcnt[7:0];
                    dut_sin  <= {hi_buf, lo_buf};
                    if (wcnt == 9'd255) begin
                        wcnt  <= 0;
                        rx_st <= WAIT1;
                    end else begin
                        wcnt  <= wcnt + 1;
                        rx_st <= GET_HI;
                    end
                end

                WAIT1: rx_st <= WAIT2;
                WAIT2: rx_st <= WAIT3;
                WAIT3: rx_st <= TRIGGER;

                TRIGGER: begin
                    dut_start <= 1;
                    rx_st     <= SYNC;
                end

                default: rx_st <= SYNC;
            endcase
        end
    end

    reg [7:0] frame_id;
    localparam TX_IDLE=3'd0, TX_SEND_ID=3'd1, TX_WAIT_ID=3'd2,
               TX_SEND_CLS=3'd3, TX_WAIT_CLS=3'd4;
    reg [2:0] tx_st;
    always @(posedge clk or negedge rst_n) begin
        if (!rst_n) begin
            tx_st<=TX_IDLE; tx_send<=0; tx_data<=0; frame_id<=0;
        end else begin
            tx_send <= 0;
            case (tx_st)
                TX_IDLE: if (dut_vout) begin
                             tx_data <= frame_id;
                             tx_st   <= TX_SEND_ID;
                         end
                TX_SEND_ID: if (!tx_busy) begin
                             tx_send <= 1;
                             tx_st   <= TX_WAIT_ID;
                         end
                TX_WAIT_ID: if (!tx_busy) begin
                             tx_data <= {4'b0000, dut_cls};
                             tx_st   <= TX_SEND_CLS;
                         end
                TX_SEND_CLS: if (!tx_busy) begin
                             tx_send <= 1;
                             tx_st   <= TX_WAIT_CLS;
                         end
                TX_WAIT_CLS: if (!tx_busy) begin
                             frame_id <= frame_id + 1;
                             tx_st    <= TX_IDLE;
                         end
                default:  tx_st <= TX_IDLE;
            endcase
        end
    end

endmodule
