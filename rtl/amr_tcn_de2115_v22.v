`timescale 1ns/1ps

module rom_cnn1_k (
  input  wire        clk,
  input  wire [7:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:191];
  initial $readmemh("mif/cnn1_k.hex", mem, 0, 191);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_cnn1_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/cnn1_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_cnn2_k (
  input  wire        clk,
  input  wire [12:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:5119];
  initial $readmemh("mif/cnn2_k.hex", mem, 0, 5119);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_cnn2_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/cnn2_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_se1_k (
  input  wire        clk,
  input  wire [6:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:127];
  initial $readmemh("mif/se_fc1_k.hex", mem, 0, 127);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_se1_b (
  input  wire        clk,
  input  wire [1:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:3];
  initial $readmemh("mif/se_fc1_b.hex", mem, 0, 3);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_se2_k (
  input  wire        clk,
  input  wire [6:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:127];
  initial $readmemh("mif/se_fc2_k.hex", mem, 0, 127);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_se2_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/se_fc2_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b0c1_k (
  input  wire        clk,
  input  wire [11:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:3071];
  initial $readmemh("mif/b0c1_k.hex", mem, 0, 3071);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b0c1_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/b0c1_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b0c2_k (
  input  wire        clk,
  input  wire [11:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:3071];
  initial $readmemh("mif/b0c2_k.hex", mem, 0, 3071);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b0c2_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/b0c2_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b1c1_k (
  input  wire        clk,
  input  wire [11:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:3071];
  initial $readmemh("mif/b1c1_k.hex", mem, 0, 3071);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b1c1_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/b1c1_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b1c2_k (
  input  wire        clk,
  input  wire [11:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:3071];
  initial $readmemh("mif/b1c2_k.hex", mem, 0, 3071);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b1c2_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/b1c2_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b2c1_k (
  input  wire        clk,
  input  wire [11:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:3071];
  initial $readmemh("mif/b2c1_k.hex", mem, 0, 3071);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b2c1_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/b2c1_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b2c2_k (
  input  wire        clk,
  input  wire [11:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:3071];
  initial $readmemh("mif/b2c2_k.hex", mem, 0, 3071);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_b2c2_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/b2c2_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_fbn_s (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/fbn_s.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_fbn_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/fbn_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_hd_k (
  input  wire        clk,
  input  wire [9:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:1023];
  initial $readmemh("mif/hd_k.hex", mem, 0, 1023);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_hd_b (
  input  wire        clk,
  input  wire [4:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:31];
  initial $readmemh("mif/hd_b.hex", mem, 0, 31);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_out_k (
  input  wire        clk,
  input  wire [8:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:351];
  initial $readmemh("mif/out_k.hex", mem, 0, 351);
  always @(posedge clk) q <= mem[addr];
endmodule

module rom_out_b (
  input  wire        clk,
  input  wire [3:0] addr,
  output reg  [15:0] q
);
  reg [15:0] mem [0:10];
  initial $readmemh("mif/out_b.hex", mem, 0, 10);
  always @(posedge clk) q <= mem[addr];
endmodule

module bram_in (
  input  wire        clk,
  input  wire        we,
  input  wire [7:0] waddr,
  input  wire [15:0] din,
  input  wire [7:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:255];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_l1 (
  input  wire        clk,
  input  wire        we,
  input  wire [11:0] waddr,
  input  wire [15:0] din,
  input  wire [11:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:4095];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_l2 (
  input  wire        clk,
  input  wire        we,
  input  wire [11:0] waddr,
  input  wire [15:0] din,
  input  wire [11:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:4095];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_se_pool (
  input  wire        clk,
  input  wire        we,
  input  wire [4:0] waddr,
  input  wire [15:0] din,
  input  wire [4:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:31];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_se (
  input  wire        clk,
  input  wire        we,
  input  wire [1:0] waddr,
  input  wire [15:0] din,
  input  wire [1:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:3];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_gate (
  input  wire        clk,
  input  wire        we,
  input  wire [4:0] waddr,
  input  wire [15:0] din,
  input  wire [4:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:31];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_se2 (
  input  wire        clk,
  input  wire        we,
  input  wire [11:0] waddr,
  input  wire [15:0] din,
  input  wire [11:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:4095];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_pool (
  input  wire        clk,
  input  wire        we,
  input  wire [10:0] waddr,
  input  wire [15:0] din,
  input  wire [10:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:2047];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_t0c1 (
  input  wire        clk,
  input  wire        we,
  input  wire [10:0] waddr,
  input  wire [15:0] din,
  input  wire [10:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:2047];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_t0 (
  input  wire        clk,
  input  wire        we,
  input  wire [10:0] waddr,
  input  wire [15:0] din,
  input  wire [10:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:2047];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_t1c1 (
  input  wire        clk,
  input  wire        we,
  input  wire [10:0] waddr,
  input  wire [15:0] din,
  input  wire [10:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:2047];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_t1 (
  input  wire        clk,
  input  wire        we,
  input  wire [10:0] waddr,
  input  wire [15:0] din,
  input  wire [10:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:2047];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_t2c1 (
  input  wire        clk,
  input  wire        we,
  input  wire [10:0] waddr,
  input  wire [15:0] din,
  input  wire [10:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:2047];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_t2 (
  input  wire        clk,
  input  wire        we,
  input  wire [10:0] waddr,
  input  wire [15:0] din,
  input  wire [10:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:2047];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_gap (
  input  wire        clk,
  input  wire        we,
  input  wire [4:0] waddr,
  input  wire [15:0] din,
  input  wire [4:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:31];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module bram_hd (
  input  wire        clk,
  input  wire        we,
  input  wire [4:0] waddr,
  input  wire [15:0] din,
  input  wire [4:0] raddr,
  output reg  [15:0] dout
);
  reg [15:0] mem [0:31];
  always @(posedge clk) begin
    if (we) mem[waddr] <= din;
    dout <= mem[raddr];
  end
endmodule

module amr_tcn_de2115_v22 (
  input  wire        clk,
  input  wire        rst_n,
  input  wire        valid_in,
  input  wire [15:0] sample_in,
  input  wire [7:0]  sample_idx,
  input  wire        start_in,
  output reg         valid_out,
  output reg  [3:0]  class_out,
  output reg  [15:0] score_out
);

  reg  [7:0] r_cnn1_k_a;  wire [15:0] r_cnn1_k_q;
  reg  [4:0] r_cnn1_b_a;  wire [15:0] r_cnn1_b_q;
  reg  [12:0] r_cnn2_k_a;  wire [15:0] r_cnn2_k_q;
  reg  [4:0] r_cnn2_b_a;  wire [15:0] r_cnn2_b_q;
  reg  [6:0] r_se1_k_a;  wire [15:0] r_se1_k_q;
  reg  [1:0] r_se1_b_a;  wire [15:0] r_se1_b_q;
  reg  [6:0] r_se2_k_a;  wire [15:0] r_se2_k_q;
  reg  [4:0] r_se2_b_a;  wire [15:0] r_se2_b_q;
  reg  [11:0] r_b0c1_k_a;  wire [15:0] r_b0c1_k_q;
  reg  [4:0] r_b0c1_b_a;  wire [15:0] r_b0c1_b_q;
  reg  [11:0] r_b0c2_k_a;  wire [15:0] r_b0c2_k_q;
  reg  [4:0] r_b0c2_b_a;  wire [15:0] r_b0c2_b_q;
  reg  [11:0] r_b1c1_k_a;  wire [15:0] r_b1c1_k_q;
  reg  [4:0] r_b1c1_b_a;  wire [15:0] r_b1c1_b_q;
  reg  [11:0] r_b1c2_k_a;  wire [15:0] r_b1c2_k_q;
  reg  [4:0] r_b1c2_b_a;  wire [15:0] r_b1c2_b_q;
  reg  [11:0] r_b2c1_k_a;  wire [15:0] r_b2c1_k_q;
  reg  [4:0] r_b2c1_b_a;  wire [15:0] r_b2c1_b_q;
  reg  [11:0] r_b2c2_k_a;  wire [15:0] r_b2c2_k_q;
  reg  [4:0] r_b2c2_b_a;  wire [15:0] r_b2c2_b_q;
  reg  [4:0] r_fbn_s_a;  wire [15:0] r_fbn_s_q;
  reg  [4:0] r_fbn_b_a;  wire [15:0] r_fbn_b_q;
  reg  [9:0] r_hd_k_a;  wire [15:0] r_hd_k_q;
  reg  [4:0] r_hd_b_a;  wire [15:0] r_hd_b_q;
  reg  [8:0] r_out_k_a;  wire [15:0] r_out_k_q;
  reg  [3:0] r_out_b_a;  wire [15:0] r_out_b_q;

  rom_cnn1_k u_cnn1_k (.clk(clk), .addr(r_cnn1_k_a), .q(r_cnn1_k_q));
  rom_cnn1_b u_cnn1_b (.clk(clk), .addr(r_cnn1_b_a), .q(r_cnn1_b_q));
  rom_cnn2_k u_cnn2_k (.clk(clk), .addr(r_cnn2_k_a), .q(r_cnn2_k_q));
  rom_cnn2_b u_cnn2_b (.clk(clk), .addr(r_cnn2_b_a), .q(r_cnn2_b_q));
  rom_se1_k u_se1_k (.clk(clk), .addr(r_se1_k_a), .q(r_se1_k_q));
  rom_se1_b u_se1_b (.clk(clk), .addr(r_se1_b_a), .q(r_se1_b_q));
  rom_se2_k u_se2_k (.clk(clk), .addr(r_se2_k_a), .q(r_se2_k_q));
  rom_se2_b u_se2_b (.clk(clk), .addr(r_se2_b_a), .q(r_se2_b_q));
  rom_b0c1_k u_b0c1_k (.clk(clk), .addr(r_b0c1_k_a), .q(r_b0c1_k_q));
  rom_b0c1_b u_b0c1_b (.clk(clk), .addr(r_b0c1_b_a), .q(r_b0c1_b_q));
  rom_b0c2_k u_b0c2_k (.clk(clk), .addr(r_b0c2_k_a), .q(r_b0c2_k_q));
  rom_b0c2_b u_b0c2_b (.clk(clk), .addr(r_b0c2_b_a), .q(r_b0c2_b_q));
  rom_b1c1_k u_b1c1_k (.clk(clk), .addr(r_b1c1_k_a), .q(r_b1c1_k_q));
  rom_b1c1_b u_b1c1_b (.clk(clk), .addr(r_b1c1_b_a), .q(r_b1c1_b_q));
  rom_b1c2_k u_b1c2_k (.clk(clk), .addr(r_b1c2_k_a), .q(r_b1c2_k_q));
  rom_b1c2_b u_b1c2_b (.clk(clk), .addr(r_b1c2_b_a), .q(r_b1c2_b_q));
  rom_b2c1_k u_b2c1_k (.clk(clk), .addr(r_b2c1_k_a), .q(r_b2c1_k_q));
  rom_b2c1_b u_b2c1_b (.clk(clk), .addr(r_b2c1_b_a), .q(r_b2c1_b_q));
  rom_b2c2_k u_b2c2_k (.clk(clk), .addr(r_b2c2_k_a), .q(r_b2c2_k_q));
  rom_b2c2_b u_b2c2_b (.clk(clk), .addr(r_b2c2_b_a), .q(r_b2c2_b_q));
  rom_fbn_s u_fbn_s (.clk(clk), .addr(r_fbn_s_a), .q(r_fbn_s_q));
  rom_fbn_b u_fbn_b (.clk(clk), .addr(r_fbn_b_a), .q(r_fbn_b_q));
  rom_hd_k u_hd_k (.clk(clk), .addr(r_hd_k_a), .q(r_hd_k_q));
  rom_hd_b u_hd_b (.clk(clk), .addr(r_hd_b_a), .q(r_hd_b_q));
  rom_out_k u_out_k (.clk(clk), .addr(r_out_k_a), .q(r_out_k_q));
  rom_out_b u_out_b (.clk(clk), .addr(r_out_b_a), .q(r_out_b_q));

  reg bi_we; reg [7:0] bi_wa, bi_ra; reg [15:0] bi_di;  wire [15:0] bi_do;
  reg bl1_we; reg [11:0] bl1_wa, bl1_ra; reg [15:0] bl1_di;  wire [15:0] bl1_do;
  reg bl2_we; reg [11:0] bl2_wa, bl2_ra; reg [15:0] bl2_di;  wire [15:0] bl2_do;
  reg bsep_we; reg [4:0] bsep_wa, bsep_ra; reg [15:0] bsep_di;  wire [15:0] bsep_do;
  reg bse_we; reg [1:0] bse_wa, bse_ra; reg [15:0] bse_di;  wire [15:0] bse_do;
  reg bg2_we; reg [4:0] bg2_wa, bg2_ra; reg [15:0] bg2_di;  wire [15:0] bg2_do;
  reg bs2_we; reg [11:0] bs2_wa, bs2_ra; reg [15:0] bs2_di;  wire [15:0] bs2_do;
  reg bp_we; reg [10:0] bp_wa, bp_ra; reg [15:0] bp_di;  wire [15:0] bp_do;
  reg bt0c_we; reg [10:0] bt0c_wa, bt0c_ra; reg [15:0] bt0c_di;  wire [15:0] bt0c_do;
  reg bt0_we; reg [10:0] bt0_wa, bt0_ra; reg [15:0] bt0_di;  wire [15:0] bt0_do;
  reg bt1c_we; reg [10:0] bt1c_wa, bt1c_ra; reg [15:0] bt1c_di;  wire [15:0] bt1c_do;
  reg bt1_we; reg [10:0] bt1_wa, bt1_ra; reg [15:0] bt1_di;  wire [15:0] bt1_do;
  reg bt2c_we; reg [10:0] bt2c_wa, bt2c_ra; reg [15:0] bt2c_di;  wire [15:0] bt2c_do;
  reg bt2_we; reg [10:0] bt2_wa, bt2_ra; reg [15:0] bt2_di;  wire [15:0] bt2_do;
  reg bg_we; reg [4:0] bg_wa, bg_ra; reg [15:0] bg_di;  wire [15:0] bg_do;
  reg bh_we; reg [4:0] bh_wa, bh_ra; reg [15:0] bh_di;  wire [15:0] bh_do;

  bram_in u_bi (.clk(clk), .we(bi_we), .waddr(bi_wa), .din(bi_di), .raddr(bi_ra), .dout(bi_do));
  bram_l1 u_bl1 (.clk(clk), .we(bl1_we), .waddr(bl1_wa), .din(bl1_di), .raddr(bl1_ra), .dout(bl1_do));
  bram_l2 u_bl2 (.clk(clk), .we(bl2_we), .waddr(bl2_wa), .din(bl2_di), .raddr(bl2_ra), .dout(bl2_do));
  bram_se_pool u_bsep (.clk(clk), .we(bsep_we), .waddr(bsep_wa), .din(bsep_di), .raddr(bsep_ra), .dout(bsep_do));
  bram_se u_bse (.clk(clk), .we(bse_we), .waddr(bse_wa), .din(bse_di), .raddr(bse_ra), .dout(bse_do));
  bram_gate u_bg2 (.clk(clk), .we(bg2_we), .waddr(bg2_wa), .din(bg2_di), .raddr(bg2_ra), .dout(bg2_do));
  bram_se2 u_bs2 (.clk(clk), .we(bs2_we), .waddr(bs2_wa), .din(bs2_di), .raddr(bs2_ra), .dout(bs2_do));
  bram_pool u_bp (.clk(clk), .we(bp_we), .waddr(bp_wa), .din(bp_di), .raddr(bp_ra), .dout(bp_do));
  bram_t0c1 u_bt0c (.clk(clk), .we(bt0c_we), .waddr(bt0c_wa), .din(bt0c_di), .raddr(bt0c_ra), .dout(bt0c_do));
  bram_t0 u_bt0 (.clk(clk), .we(bt0_we), .waddr(bt0_wa), .din(bt0_di), .raddr(bt0_ra), .dout(bt0_do));
  bram_t1c1 u_bt1c (.clk(clk), .we(bt1c_we), .waddr(bt1c_wa), .din(bt1c_di), .raddr(bt1c_ra), .dout(bt1c_do));
  bram_t1 u_bt1 (.clk(clk), .we(bt1_we), .waddr(bt1_wa), .din(bt1_di), .raddr(bt1_ra), .dout(bt1_do));
  bram_t2c1 u_bt2c (.clk(clk), .we(bt2c_we), .waddr(bt2c_wa), .din(bt2c_di), .raddr(bt2c_ra), .dout(bt2c_do));
  bram_t2 u_bt2 (.clk(clk), .we(bt2_we), .waddr(bt2_wa), .din(bt2_di), .raddr(bt2_ra), .dout(bt2_do));
  bram_gap u_bg (.clk(clk), .we(bg_we), .waddr(bg_wa), .din(bg_di), .raddr(bg_ra), .dout(bg_do));
  bram_hd u_bh (.clk(clk), .we(bh_we), .waddr(bh_wa), .din(bh_di), .raddr(bh_ra), .dout(bh_do));

  reg signed [31:0] acc;
  reg signed [47:0] gap_acc;
  reg [6:0]   ct;
  reg [5:0]  cth;
  reg [4:0]   coc;
  reg [4:0]   cic;
  reg [2:0]         ck;
  reg [1:0]  cse;
  reg [3:0]  ccl;
  reg signed [15:0] best_s;
  reg [3:0]          best_c;
  reg signed [15:0]  se_gate;
  reg        [15:0]  pool_a;

  reg [6:0] st;

  localparam S_IDLE               = 7'd0;
  localparam S_C1_BIAS            = 7'd1;
  localparam S_C1_WAIT            = 7'd2;
  localparam S_C1_MAC             = 7'd3;
  localparam S_C1_WR              = 7'd4;
  localparam S_C2_BIAS            = 7'd5;
  localparam S_C2_WAIT            = 7'd6;
  localparam S_C2_MAC             = 7'd7;
  localparam S_C2_WR              = 7'd8;
  localparam S_SE_GAP_INIT        = 7'd9;
  localparam S_SE_GAP_FETCH       = 7'd10;
  localparam S_SE_GAP_WAIT        = 7'd11;
  localparam S_SE_GAP_MAC         = 7'd12;
  localparam S_SE_GAP_WR          = 7'd13;
  localparam S_SE1_BIAS           = 7'd14;
  localparam S_SE1_WAIT           = 7'd15;
  localparam S_SE1_MAC            = 7'd16;
  localparam S_SE1_WR             = 7'd17;
  localparam S_SE2_BIAS           = 7'd18;
  localparam S_SE2_WAIT           = 7'd19;
  localparam S_SE2_MAC            = 7'd20;
  localparam S_SE2_SIG            = 7'd21;
  localparam S_SE2_WR             = 7'd22;
  localparam S_SE_MUL_INIT        = 7'd23;
  localparam S_SE_MUL_FETCH       = 7'd24;
  localparam S_SE_MUL_WAIT        = 7'd25;
  localparam S_SE_MUL_MAC         = 7'd26;
  localparam S_SE_MUL_WR          = 7'd27;
  localparam S_POOL_BIAS          = 7'd28;
  localparam S_POOL_WAIT_A        = 7'd29;
  localparam S_POOL_FETCH         = 7'd30;
  localparam S_POOL_WAIT_B        = 7'd31;
  localparam S_POOL_MAC           = 7'd32;
  localparam S_POOL_WR            = 7'd33;
  localparam S_T0C1_BIAS          = 7'd34;
  localparam S_T0C1_WAIT          = 7'd35;
  localparam S_T0C1_MAC           = 7'd36;
  localparam S_T0C1_WR            = 7'd37;
  localparam S_T0C2_BIAS          = 7'd38;
  localparam S_T0C2_WAIT          = 7'd39;
  localparam S_T0C2_MAC           = 7'd40;
  localparam S_T0C2_RES           = 7'd41;
  localparam S_T0C2_WAIT2         = 7'd42;
  localparam S_T0C2_WR            = 7'd43;
  localparam S_T1C1_BIAS          = 7'd44;
  localparam S_T1C1_WAIT          = 7'd45;
  localparam S_T1C1_MAC           = 7'd46;
  localparam S_T1C1_WR            = 7'd47;
  localparam S_T1C2_BIAS          = 7'd48;
  localparam S_T1C2_WAIT          = 7'd49;
  localparam S_T1C2_MAC           = 7'd50;
  localparam S_T1C2_RES           = 7'd51;
  localparam S_T1C2_WAIT2         = 7'd52;
  localparam S_T1C2_WR            = 7'd53;
  localparam S_T2C1_BIAS          = 7'd54;
  localparam S_T2C1_WAIT          = 7'd55;
  localparam S_T2C1_MAC           = 7'd56;
  localparam S_T2C1_WR            = 7'd57;
  localparam S_T2C2_BIAS          = 7'd58;
  localparam S_T2C2_WAIT          = 7'd59;
  localparam S_T2C2_MAC           = 7'd60;
  localparam S_T2C2_RES           = 7'd61;
  localparam S_T2C2_WAIT2         = 7'd62;
  localparam S_T2C2_WR            = 7'd63;
  localparam S_GAP_INIT           = 7'd64;
  localparam S_GAP_FETCH          = 7'd65;
  localparam S_GAP_WAIT           = 7'd66;
  localparam S_GAP_MAC            = 7'd67;
  localparam S_GAP_WR             = 7'd68;
  localparam S_HD_BIAS            = 7'd69;
  localparam S_HD_WAIT            = 7'd70;
  localparam S_HD_MAC             = 7'd71;
  localparam S_HD_MAC_LAST        = 7'd72;
  localparam S_HD_WR              = 7'd73;
  localparam S_OUT_BIAS           = 7'd74;
  localparam S_OUT_WAIT           = 7'd75;
  localparam S_OUT_MAC            = 7'd76;
  localparam S_OUT_MAC_LAST       = 7'd77;
  localparam S_OUT_ARG            = 7'd78;
  localparam S_OUT_DONE           = 7'd79;

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) bi_we <= 0;
    else begin
      bi_we <= valid_in;
      bi_wa <= sample_idx[7:0];
      bi_di <= sample_in;
    end
  end

  function automatic [15:0] sat16;
    input signed [31:0] x;
    begin
      if      (x >  32'sd32767)  sat16 = 16'sh7FFF;
      else if (x < -32'sd32768)  sat16 = 16'sh8000;
      else                       sat16 = x[15:0];
    end
  endfunction

  function automatic [15:0] sat16_48;
    input signed [47:0] x;
    begin
      if      (x >  48'sd32767)  sat16_48 = 16'sh7FFF;
      else if (x < -48'sd32768)  sat16_48 = 16'sh8000;
      else                       sat16_48 = x[15:0];
    end
  endfunction

  function automatic [15:0] relu16;
    input signed [15:0] x;
    relu16 = ($signed(x) > 16'sh0) ? x : 16'h0000;
  endfunction

  function automatic [15:0] hsig;
    input signed [15:0] x;
    reg signed [31:0] t;
    begin
      if      ($signed(x) <= $signed(16'shF000)) hsig = 16'h0000;
      else if ($signed(x) >= $signed(16'sh1000)) hsig = 16'h0400;
      else begin
        t = ($signed(x) * $signed(16'sh0080)) >>> 10;
        hsig = 16'h0200 + t[15:0];
      end
    end
  endfunction

  always @(posedge clk or negedge rst_n) begin
    if (!rst_n) begin
      st <= S_IDLE; valid_out <= 0; class_out <= 0; score_out <= 0;
      ct <= 0; cth <= 0; coc <= 0; cic <= 0; ck <= 0;
      cse <= 0; ccl <= 0; acc <= 0; gap_acc <= 0; pool_a <= 0;
      best_s <= 0; best_c <= 0; se_gate <= 0;
      bl1_we<=0; bl2_we<=0; bsep_we<=0; bse_we<=0; bg2_we<=0; bs2_we<=0; bp_we<=0;
      bt0c_we<=0; bt0_we<=0;
      bt1c_we<=0; bt1_we<=0;
      bt2c_we<=0; bt2_we<=0;
      bg_we<=0; bh_we<=0;
    end else begin
      bl1_we<=0; bl2_we<=0; bsep_we<=0; bse_we<=0; bg2_we<=0; bs2_we<=0; bp_we<=0;
      bt0c_we<=0; bt0_we<=0;
      bt1c_we<=0; bt1_we<=0;
      bt2c_we<=0; bt2_we<=0;
      bg_we<=0; bh_we<=0;

      case (st)

        S_IDLE: begin
          valid_out <= 0;
          if (start_in) begin
            ct<=0; cth<=0; coc<=0; cic<=0; ck<=0;
            cse<=0; ccl<=0; acc<=0; gap_acc<=0;
            best_s <= 16'sh8000; best_c <= 0;
            st <= S_C1_BIAS;
          end
        end

        S_C1_BIAS: begin
          r_cnn1_b_a <= coc;
          ck <= 0; cic <= 0;
          r_cnn1_k_a <= coc;
          begin : C1B0
            reg signed [7:0] ti;
            ti = $signed({1'b0, ct}) + 0 - 1;
            if (ti >= 0 && ti < 128)
              bi_ra <= $unsigned(ti[6:0]) * 2 + 0;
            else
              bi_ra <= 0;
          end
          st <= S_C1_WAIT;
        end

        S_C1_WAIT: st <= S_C1_MAC;

        S_C1_MAC: begin
          begin : C1M
            reg signed [7:0] ti;
            ti = $signed({1'b0, ct}) + ck - 1;
            if (cic == 0 && ck == 0)
              acc <= $signed({{16{r_cnn1_b_q[15]}}, r_cnn1_b_q})
                     + ((ti >= 0 && ti < 128) ? (($signed(bi_do) * $signed(r_cnn1_k_q)) >>> 10) : 0);
            else if (ti >= 0 && ti < 128)
              acc <= acc + (($signed(bi_do) * $signed(r_cnn1_k_q)) >>> 10);
          end
          if (cic < 1) begin
            cic <= cic + 1;
            r_cnn1_k_a <= ck * 2 * 32 + (cic+1) * 32 + coc;
            begin : C1M_ni
              reg signed [7:0] ti;
              ti = $signed({1'b0, ct}) + ck - 1;
              if (ti >= 0 && ti < 128) bi_ra <= $unsigned(ti[6:0]) * 2 + cic + 1;
              else bi_ra <= 0;
            end
            st <= S_C1_WAIT;
          end else begin cic <= 0;
            if (ck < 2) begin
              ck <= ck + 1;
              r_cnn1_k_a <= (ck+1) * 2 * 32 + coc;
              begin : C1M_nk
                reg signed [7:0] ti;
                ti = $signed({1'b0, ct}) + ck + 1 - 1;
                if (ti >= 0 && ti < 128) bi_ra <= $unsigned(ti[6:0]) * 2;
                else bi_ra <= 0;
              end
              st <= S_C1_WAIT;
            end else begin ck <= 0; st <= S_C1_WR; end
          end
        end

        S_C1_WR: begin
          bl1_we <= 1;
          bl1_wa <= ct * 32 + coc;
          bl1_di <= relu16(sat16(acc));
          if (coc < 31) begin coc <= coc+1; st <= S_C1_BIAS; end
          else begin coc <= 0;
            if (ct < 127) begin ct <= ct+1; st <= S_C1_BIAS; end
            else begin ct <= 0; st <= S_C2_BIAS; end
          end
        end

        S_C2_BIAS: begin
          r_cnn2_b_a <= coc;
          ck <= 0; cic <= 0;
          r_cnn2_k_a <= coc;
          begin : C2B0
            reg signed [7:0] ti;
            ti = $signed({1'b0, ct}) + 0 - 2;
            if (ti >= 0 && ti < 128)
              bl1_ra <= $unsigned(ti[6:0]) * 32 + 0;
            else
              bl1_ra <= 0;
          end
          st <= S_C2_WAIT;
        end

        S_C2_WAIT: st <= S_C2_MAC;

        S_C2_MAC: begin
          begin : C2M
            reg signed [7:0] ti;
            ti = $signed({1'b0, ct}) + ck - 2;
            if (cic == 0 && ck == 0)
              acc <= $signed({{16{r_cnn2_b_q[15]}}, r_cnn2_b_q})
                     + ((ti >= 0 && ti < 128) ? (($signed(bl1_do) * $signed(r_cnn2_k_q)) >>> 10) : 0);
            else if (ti >= 0 && ti < 128)
              acc <= acc + (($signed(bl1_do) * $signed(r_cnn2_k_q)) >>> 10);
          end
          if (cic < 31) begin
            cic <= cic + 1;
            r_cnn2_k_a <= ck * 32 * 32 + (cic+1) * 32 + coc;
            begin : C2M_ni
              reg signed [7:0] ti;
              ti = $signed({1'b0, ct}) + ck - 2;
              if (ti >= 0 && ti < 128) bl1_ra <= $unsigned(ti[6:0]) * 32 + cic + 1;
              else bl1_ra <= 0;
            end
            st <= S_C2_WAIT;
          end else begin cic <= 0;
            if (ck < 4) begin
              ck <= ck + 1;
              r_cnn2_k_a <= (ck+1) * 32 * 32 + coc;
              begin : C2M_nk
                reg signed [7:0] ti;
                ti = $signed({1'b0, ct}) + ck + 1 - 2;
                if (ti >= 0 && ti < 128) bl1_ra <= $unsigned(ti[6:0]) * 32;
                else bl1_ra <= 0;
              end
              st <= S_C2_WAIT;
            end else begin ck <= 0; st <= S_C2_WR; end
          end
        end

        S_C2_WR: begin
          bl2_we <= 1;
          bl2_wa <= ct * 32 + coc;
          bl2_di <= relu16(sat16(acc));
          if (coc < 31) begin coc <= coc+1; st <= S_C2_BIAS; end
          else begin coc <= 0;
            if (ct < 127) begin ct <= ct+1; st <= S_C2_BIAS; end
            else begin ct <= 0; st <= S_SE_GAP_INIT; end
          end
        end

        S_SE_GAP_INIT: begin
          gap_acc <= 0; ct <= 0; coc <= 0;
          bl2_ra <= 0;
          st <= S_SE_GAP_FETCH;
        end

        S_SE_GAP_FETCH: begin
          bl2_ra <= ct * 32 + coc;
          st <= S_SE_GAP_WAIT;
        end

        S_SE_GAP_WAIT: st <= S_SE_GAP_MAC;

        S_SE_GAP_MAC: begin
          gap_acc <= gap_acc + $signed({{32{bl2_do[15]}}, bl2_do});
          if (ct < 127) begin
            ct <= ct + 1;
            bl2_ra <= (ct+1) * 32 + coc;
            st <= S_SE_GAP_WAIT;
          end else begin ct <= 0; st <= S_SE_GAP_WR; end
        end

        S_SE_GAP_WR: begin
          bsep_we <= 1; bsep_wa <= coc;
          bsep_di <= sat16_48(gap_acc >>> 7);
          gap_acc <= 0;
          if (coc < 31) begin
            coc <= coc+1; ct <= 0;
            bl2_ra <= 0 * 32 + (coc+1);
            st <= S_SE_GAP_FETCH;
          end else begin coc <= 0; st <= S_SE1_BIAS; end
        end

        S_SE1_BIAS: begin
          r_se1_b_a <= cse;
          cic <= 0;
          r_se1_k_a <= cse;
          bsep_ra <= 0;
          st <= S_SE1_WAIT;
        end

        S_SE1_WAIT: st <= S_SE1_MAC;

        S_SE1_MAC: begin
          if (cic == 0)
            acc <= $signed({{16{r_se1_b_q[15]}}, r_se1_b_q}) + (($signed(bsep_do) * $signed(r_se1_k_q)) >>> 10);
          else
            acc <= acc + (($signed(bsep_do) * $signed(r_se1_k_q)) >>> 10);
          if (cic < 31) begin
            cic <= cic + 1;
            r_se1_k_a <= (cic+1) * 4 + cse;
            bsep_ra <= cic + 1;
            st <= S_SE1_WAIT;
          end else begin cic <= 0; st <= S_SE1_WR; end
        end

        S_SE1_WR: begin
          bse_we <= 1;
          bse_wa <= cse;
          bse_di <= relu16(sat16(acc));
          if (cse < 3) begin cse <= cse+1; st <= S_SE1_BIAS; end
          else begin cse <= 0; st <= S_SE2_BIAS; end
        end

        S_SE2_BIAS: begin
          r_se2_b_a <= coc;
          cse <= 0;
          r_se2_k_a <= coc;
          bse_ra <= 0;
          st <= S_SE2_WAIT;
        end

        S_SE2_WAIT: st <= S_SE2_MAC;

        S_SE2_MAC: begin
          if (cse == 0)
            acc <= $signed({{16{r_se2_b_q[15]}}, r_se2_b_q}) + (($signed(bse_do) * $signed(r_se2_k_q)) >>> 10);
          else
            acc <= acc + (($signed(bse_do) * $signed(r_se2_k_q)) >>> 10);
          if (cse < 3) begin
            cse <= cse + 1;
            r_se2_k_a <= (cse+1) * 32 + coc;
            bse_ra <= cse + 1;
            st <= S_SE2_WAIT;
          end else begin cse <= 0; st <= S_SE2_SIG; end
        end

        S_SE2_SIG: begin
          se_gate <= hsig(sat16(acc));
          st <= S_SE2_WR;
        end

        S_SE2_WR: begin
          bg2_we <= 1;
          bg2_wa <= coc;
          bg2_di <= se_gate;
          if (coc < 31) begin coc <= coc+1; st <= S_SE2_BIAS; end
          else begin coc <= 0; st <= S_SE_MUL_INIT; end
        end

        S_SE_MUL_INIT: begin
          ct <= 0; coc <= 0;
          bg2_ra <= 0;
          bl2_ra <= 0;
          st <= S_SE_MUL_FETCH;
        end

        S_SE_MUL_FETCH: begin
          bg2_ra <= coc;
          bl2_ra <= ct * 32 + coc;
          st <= S_SE_MUL_WAIT;
        end

        S_SE_MUL_WAIT: st <= S_SE_MUL_MAC;

        S_SE_MUL_MAC: begin
          acc <= ($signed(bg2_do) * $signed(bl2_do)) >>> 10;
          st <= S_SE_MUL_WR;
        end

        S_SE_MUL_WR: begin
          bs2_we <= 1;
          bs2_wa <= ct * 32 + coc;
          bs2_di <= sat16(acc);
          if (coc < 31) begin coc <= coc+1; st <= S_SE_MUL_FETCH; end
          else begin coc <= 0;
            if (ct < 127) begin ct <= ct+1; st <= S_SE_MUL_FETCH; end
            else begin ct <= 0; st <= S_POOL_BIAS; end
          end
        end

        S_POOL_BIAS: begin
          bs2_ra <= cth * 2 * 32 + coc;
          st <= S_POOL_WAIT_A;
        end

        S_POOL_WAIT_A: st <= S_POOL_FETCH;

        S_POOL_FETCH: begin
          pool_a <= bs2_do;
          bs2_ra <= (cth * 2 + 1) * 32 + coc;
          st <= S_POOL_WAIT_B;
        end

        S_POOL_WAIT_B: st <= S_POOL_MAC;

        S_POOL_MAC: begin
          bp_we <= 1;
          bp_wa <= cth * 32 + coc;
          bp_di <= ($signed(pool_a) > $signed(bs2_do)) ? pool_a : bs2_do;
          st <= S_POOL_WR;
        end

        S_POOL_WR: begin
          if (coc < 31) begin coc <= coc+1; st <= S_POOL_BIAS; end
          else begin coc <= 0;
            if (cth < 63) begin cth <= cth+1; st <= S_POOL_BIAS; end
            else begin cth <= 0; st <= S_T0C1_BIAS; end
          end
        end

        S_T0C1_BIAS: begin
          r_b0c1_b_a <= coc;
          ck <= 0; cic <= 0;
          r_b0c1_k_a <= coc;
          begin : T0C1B0
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 2 + 0 * 1;
            if (ti >= 0 && ti < 64)
              bp_ra <= $unsigned(ti[5:0]) * 32 + 0;
            else
              bp_ra <= 0;
          end
          st <= S_T0C1_WAIT;
        end

        S_T0C1_WAIT: st <= S_T0C1_MAC;

        S_T0C1_MAC: begin
          begin : T0C1M
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 2 + ck * 1;
            if (cic == 0 && ck == 0)
              acc <= $signed({{16{r_b0c1_b_q[15]}}, r_b0c1_b_q})
                     + ((ti >= 0 && ti < 64) ? (($signed(bp_do) * $signed(r_b0c1_k_q)) >>> 10) : 0);
            else if (ti >= 0 && ti < 64)
              acc <= acc + (($signed(bp_do) * $signed(r_b0c1_k_q)) >>> 10);
          end
          if (cic < 31) begin
            cic <= cic + 1;
            r_b0c1_k_a <= ck * 32 * 32 + (cic+1) * 32 + coc;
            begin : T0C1M_ni
              reg signed [7:0] ti;
              ti = $signed({2'b00, cth}) - 2 + ck * 1;
              if (ti >= 0 && ti < 64)
                bp_ra <= $unsigned(ti[5:0]) * 32 + cic + 1;
              else
                bp_ra <= 0;
            end
            st <= S_T0C1_WAIT;
          end else begin cic <= 0;
            if (ck < 2) begin
              ck <= ck + 1;
              r_b0c1_k_a <= (ck+1) * 32 * 32 + coc;
              begin : T0C1M_nk
                reg signed [7:0] ti;
                ti = $signed({2'b00, cth}) - 2 + (ck+1) * 1;
                if (ti >= 0 && ti < 64)
                  bp_ra <= $unsigned(ti[5:0]) * 32;
                else
                  bp_ra <= 0;
              end
              st <= S_T0C1_WAIT;
            end else begin ck <= 0; st <= S_T0C1_WR; end
          end
        end

        S_T0C2_BIAS: begin
          r_b0c2_b_a <= coc;
          ck <= 0; cic <= 0;
          r_b0c2_k_a <= coc;
          begin : T0C2B0
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 2 + 0 * 1;
            if (ti >= 0 && ti < 64)
              bt0c_ra <= $unsigned(ti[5:0]) * 32 + 0;
            else
              bt0c_ra <= 0;
          end
          st <= S_T0C2_WAIT;
        end

        S_T0C2_WAIT: st <= S_T0C2_MAC;

        S_T0C2_MAC: begin
          begin : T0C2M
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 2 + ck * 1;
            if (cic == 0 && ck == 0)
              acc <= $signed({{16{r_b0c2_b_q[15]}}, r_b0c2_b_q})
                     + ((ti >= 0 && ti < 64) ? (($signed(bt0c_do) * $signed(r_b0c2_k_q)) >>> 10) : 0);
            else if (ti >= 0 && ti < 64)
              acc <= acc + (($signed(bt0c_do) * $signed(r_b0c2_k_q)) >>> 10);
          end
          if (cic < 31) begin
            cic <= cic + 1;
            r_b0c2_k_a <= ck * 32 * 32 + (cic+1) * 32 + coc;
            begin : T0C2M_ni
              reg signed [7:0] ti;
              ti = $signed({2'b00, cth}) - 2 + ck * 1;
              if (ti >= 0 && ti < 64)
                bt0c_ra <= $unsigned(ti[5:0]) * 32 + cic + 1;
              else
                bt0c_ra <= 0;
            end
            st <= S_T0C2_WAIT;
          end else begin cic <= 0;
            if (ck < 2) begin
              ck <= ck + 1;
              r_b0c2_k_a <= (ck+1) * 32 * 32 + coc;
              begin : T0C2M_nk
                reg signed [7:0] ti;
                ti = $signed({2'b00, cth}) - 2 + (ck+1) * 1;
                if (ti >= 0 && ti < 64)
                  bt0c_ra <= $unsigned(ti[5:0]) * 32;
                else
                  bt0c_ra <= 0;
              end
              st <= S_T0C2_WAIT;
            end else begin ck <= 0; st <= S_T0C2_RES; end
          end
        end

        S_T0C2_RES: begin
          bp_ra <= cth * 32 + coc;
          st <= S_T0C2_WAIT2;
        end

        S_T0C2_WAIT2: st <= S_T0C2_WR;

        S_T0C1_WR: begin
          bt0c_we <= 1;
          bt0c_wa <= cth * 32 + coc;
          bt0c_di <= relu16(sat16(acc));
          if (coc < 31) begin coc <= coc+1; st <= S_T0C1_BIAS; end
          else begin coc <= 0;
            if (cth < 63) begin cth <= cth+1; st <= S_T0C1_BIAS; end
            else begin cth <= 0; st <= S_T0C2_BIAS; end
          end
        end

        S_T0C2_WR: begin

          bt0_we <= 1;
          bt0_wa <= cth * 32 + coc;
          bt0_di <= relu16(sat16(acc + {{16{bp_do[15]}}, bp_do}));
          if (coc < 31) begin coc <= coc+1; st <= S_T0C2_BIAS; end
          else begin coc <= 0;
            if (cth < 63) begin cth <= cth+1; st <= S_T0C2_BIAS; end
            else begin cth <= 0; st <= S_T1C1_BIAS; end
          end
        end

        S_T1C1_BIAS: begin
          r_b1c1_b_a <= coc;
          ck <= 0; cic <= 0;
          r_b1c1_k_a <= coc;
          begin : T1C1B0
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 4 + 0 * 2;
            if (ti >= 0 && ti < 64)
              bt0_ra <= $unsigned(ti[5:0]) * 32 + 0;
            else
              bt0_ra <= 0;
          end
          st <= S_T1C1_WAIT;
        end

        S_T1C1_WAIT: st <= S_T1C1_MAC;

        S_T1C1_MAC: begin
          begin : T1C1M
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 4 + ck * 2;
            if (cic == 0 && ck == 0)
              acc <= $signed({{16{r_b1c1_b_q[15]}}, r_b1c1_b_q})
                     + ((ti >= 0 && ti < 64) ? (($signed(bt0_do) * $signed(r_b1c1_k_q)) >>> 10) : 0);
            else if (ti >= 0 && ti < 64)
              acc <= acc + (($signed(bt0_do) * $signed(r_b1c1_k_q)) >>> 10);
          end
          if (cic < 31) begin
            cic <= cic + 1;
            r_b1c1_k_a <= ck * 32 * 32 + (cic+1) * 32 + coc;
            begin : T1C1M_ni
              reg signed [7:0] ti;
              ti = $signed({2'b00, cth}) - 4 + ck * 2;
              if (ti >= 0 && ti < 64)
                bt0_ra <= $unsigned(ti[5:0]) * 32 + cic + 1;
              else
                bt0_ra <= 0;
            end
            st <= S_T1C1_WAIT;
          end else begin cic <= 0;
            if (ck < 2) begin
              ck <= ck + 1;
              r_b1c1_k_a <= (ck+1) * 32 * 32 + coc;
              begin : T1C1M_nk
                reg signed [7:0] ti;
                ti = $signed({2'b00, cth}) - 4 + (ck+1) * 2;
                if (ti >= 0 && ti < 64)
                  bt0_ra <= $unsigned(ti[5:0]) * 32;
                else
                  bt0_ra <= 0;
              end
              st <= S_T1C1_WAIT;
            end else begin ck <= 0; st <= S_T1C1_WR; end
          end
        end

        S_T1C2_BIAS: begin
          r_b1c2_b_a <= coc;
          ck <= 0; cic <= 0;
          r_b1c2_k_a <= coc;
          begin : T1C2B0
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 4 + 0 * 2;
            if (ti >= 0 && ti < 64)
              bt1c_ra <= $unsigned(ti[5:0]) * 32 + 0;
            else
              bt1c_ra <= 0;
          end
          st <= S_T1C2_WAIT;
        end

        S_T1C2_WAIT: st <= S_T1C2_MAC;

        S_T1C2_MAC: begin
          begin : T1C2M
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 4 + ck * 2;
            if (cic == 0 && ck == 0)
              acc <= $signed({{16{r_b1c2_b_q[15]}}, r_b1c2_b_q})
                     + ((ti >= 0 && ti < 64) ? (($signed(bt1c_do) * $signed(r_b1c2_k_q)) >>> 10) : 0);
            else if (ti >= 0 && ti < 64)
              acc <= acc + (($signed(bt1c_do) * $signed(r_b1c2_k_q)) >>> 10);
          end
          if (cic < 31) begin
            cic <= cic + 1;
            r_b1c2_k_a <= ck * 32 * 32 + (cic+1) * 32 + coc;
            begin : T1C2M_ni
              reg signed [7:0] ti;
              ti = $signed({2'b00, cth}) - 4 + ck * 2;
              if (ti >= 0 && ti < 64)
                bt1c_ra <= $unsigned(ti[5:0]) * 32 + cic + 1;
              else
                bt1c_ra <= 0;
            end
            st <= S_T1C2_WAIT;
          end else begin cic <= 0;
            if (ck < 2) begin
              ck <= ck + 1;
              r_b1c2_k_a <= (ck+1) * 32 * 32 + coc;
              begin : T1C2M_nk
                reg signed [7:0] ti;
                ti = $signed({2'b00, cth}) - 4 + (ck+1) * 2;
                if (ti >= 0 && ti < 64)
                  bt1c_ra <= $unsigned(ti[5:0]) * 32;
                else
                  bt1c_ra <= 0;
              end
              st <= S_T1C2_WAIT;
            end else begin ck <= 0; st <= S_T1C2_RES; end
          end
        end

        S_T1C2_RES: begin
          bt0_ra <= cth * 32 + coc;
          st <= S_T1C2_WAIT2;
        end

        S_T1C2_WAIT2: st <= S_T1C2_WR;

        S_T1C1_WR: begin
          bt1c_we <= 1;
          bt1c_wa <= cth * 32 + coc;
          bt1c_di <= relu16(sat16(acc));
          if (coc < 31) begin coc <= coc+1; st <= S_T1C1_BIAS; end
          else begin coc <= 0;
            if (cth < 63) begin cth <= cth+1; st <= S_T1C1_BIAS; end
            else begin cth <= 0; st <= S_T1C2_BIAS; end
          end
        end

        S_T1C2_WR: begin

          bt1_we <= 1;
          bt1_wa <= cth * 32 + coc;
          bt1_di <= relu16(sat16(acc + {{16{bt0_do[15]}}, bt0_do}));
          if (coc < 31) begin coc <= coc+1; st <= S_T1C2_BIAS; end
          else begin coc <= 0;
            if (cth < 63) begin cth <= cth+1; st <= S_T1C2_BIAS; end
            else begin cth <= 0; st <= S_T2C1_BIAS; end
          end
        end

        S_T2C1_BIAS: begin
          r_b2c1_b_a <= coc;
          ck <= 0; cic <= 0;
          r_b2c1_k_a <= coc;
          begin : T2C1B0
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 8 + 0 * 4;
            if (ti >= 0 && ti < 64)
              bt1_ra <= $unsigned(ti[5:0]) * 32 + 0;
            else
              bt1_ra <= 0;
          end
          st <= S_T2C1_WAIT;
        end

        S_T2C1_WAIT: st <= S_T2C1_MAC;

        S_T2C1_MAC: begin
          begin : T2C1M
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 8 + ck * 4;
            if (cic == 0 && ck == 0)
              acc <= $signed({{16{r_b2c1_b_q[15]}}, r_b2c1_b_q})
                     + ((ti >= 0 && ti < 64) ? (($signed(bt1_do) * $signed(r_b2c1_k_q)) >>> 10) : 0);
            else if (ti >= 0 && ti < 64)
              acc <= acc + (($signed(bt1_do) * $signed(r_b2c1_k_q)) >>> 10);
          end
          if (cic < 31) begin
            cic <= cic + 1;
            r_b2c1_k_a <= ck * 32 * 32 + (cic+1) * 32 + coc;
            begin : T2C1M_ni
              reg signed [7:0] ti;
              ti = $signed({2'b00, cth}) - 8 + ck * 4;
              if (ti >= 0 && ti < 64)
                bt1_ra <= $unsigned(ti[5:0]) * 32 + cic + 1;
              else
                bt1_ra <= 0;
            end
            st <= S_T2C1_WAIT;
          end else begin cic <= 0;
            if (ck < 2) begin
              ck <= ck + 1;
              r_b2c1_k_a <= (ck+1) * 32 * 32 + coc;
              begin : T2C1M_nk
                reg signed [7:0] ti;
                ti = $signed({2'b00, cth}) - 8 + (ck+1) * 4;
                if (ti >= 0 && ti < 64)
                  bt1_ra <= $unsigned(ti[5:0]) * 32;
                else
                  bt1_ra <= 0;
              end
              st <= S_T2C1_WAIT;
            end else begin ck <= 0; st <= S_T2C1_WR; end
          end
        end

        S_T2C2_BIAS: begin
          r_b2c2_b_a <= coc;
          ck <= 0; cic <= 0;
          r_b2c2_k_a <= coc;
          begin : T2C2B0
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 8 + 0 * 4;
            if (ti >= 0 && ti < 64)
              bt2c_ra <= $unsigned(ti[5:0]) * 32 + 0;
            else
              bt2c_ra <= 0;
          end
          st <= S_T2C2_WAIT;
        end

        S_T2C2_WAIT: st <= S_T2C2_MAC;

        S_T2C2_MAC: begin
          begin : T2C2M
            reg signed [7:0] ti;
            ti = $signed({2'b00, cth}) - 8 + ck * 4;
            if (cic == 0 && ck == 0)
              acc <= $signed({{16{r_b2c2_b_q[15]}}, r_b2c2_b_q})
                     + ((ti >= 0 && ti < 64) ? (($signed(bt2c_do) * $signed(r_b2c2_k_q)) >>> 10) : 0);
            else if (ti >= 0 && ti < 64)
              acc <= acc + (($signed(bt2c_do) * $signed(r_b2c2_k_q)) >>> 10);
          end
          if (cic < 31) begin
            cic <= cic + 1;
            r_b2c2_k_a <= ck * 32 * 32 + (cic+1) * 32 + coc;
            begin : T2C2M_ni
              reg signed [7:0] ti;
              ti = $signed({2'b00, cth}) - 8 + ck * 4;
              if (ti >= 0 && ti < 64)
                bt2c_ra <= $unsigned(ti[5:0]) * 32 + cic + 1;
              else
                bt2c_ra <= 0;
            end
            st <= S_T2C2_WAIT;
          end else begin cic <= 0;
            if (ck < 2) begin
              ck <= ck + 1;
              r_b2c2_k_a <= (ck+1) * 32 * 32 + coc;
              begin : T2C2M_nk
                reg signed [7:0] ti;
                ti = $signed({2'b00, cth}) - 8 + (ck+1) * 4;
                if (ti >= 0 && ti < 64)
                  bt2c_ra <= $unsigned(ti[5:0]) * 32;
                else
                  bt2c_ra <= 0;
              end
              st <= S_T2C2_WAIT;
            end else begin ck <= 0; st <= S_T2C2_RES; end
          end
        end

        S_T2C2_RES: begin
          bt1_ra <= cth * 32 + coc;
          st <= S_T2C2_WAIT2;
        end

        S_T2C2_WAIT2: st <= S_T2C2_WR;

        S_T2C1_WR: begin
          bt2c_we <= 1;
          bt2c_wa <= cth * 32 + coc;
          bt2c_di <= relu16(sat16(acc));
          if (coc < 31) begin coc <= coc+1; st <= S_T2C1_BIAS; end
          else begin coc <= 0;
            if (cth < 63) begin cth <= cth+1; st <= S_T2C1_BIAS; end
            else begin cth <= 0; st <= S_T2C2_BIAS; end
          end
        end

        S_T2C2_WR: begin

          bt2_we <= 1;
          bt2_wa <= cth * 32 + coc;
          bt2_di <= relu16(sat16(acc + {{16{bt1_do[15]}}, bt1_do}));
          if (coc < 31) begin coc <= coc+1; st <= S_T2C2_BIAS; end
          else begin coc <= 0;
            if (cth < 63) begin cth <= cth+1; st <= S_T2C2_BIAS; end
            else begin cth <= 0; st <= S_GAP_INIT; end
          end
        end

        S_GAP_INIT: begin
          gap_acc <= 0; cth <= 0; cic <= 0; st <= S_GAP_FETCH;
        end

        S_GAP_FETCH: begin
          r_fbn_s_a <= cic;
          r_fbn_b_a <= cic;
          bt2_ra <= cth * 32 + cic;
          st <= S_GAP_WAIT;
        end

        S_GAP_WAIT: st <= S_GAP_MAC;

        S_GAP_MAC: begin
          gap_acc <= gap_acc + (($signed(bt2_do) * $signed(r_fbn_s_q)) >>> 10);
          if (cth < 63) begin
            cth <= cth + 1;
            bt2_ra <= (cth+1) * 32 + cic;
            st <= S_GAP_WAIT;
          end else begin cth <= 0; st <= S_GAP_WR; end
        end

        S_GAP_WR: begin
          bg_we <= 1; bg_wa <= cic;
          bg_di <= sat16_48((gap_acc >>> 6) + {{32{r_fbn_b_q[15]}}, r_fbn_b_q});
          gap_acc <= 0;
          if (cic < 31) begin
            cic <= cic + 1;
            cth <= 0;
            r_fbn_s_a <= cic + 1;
            r_fbn_b_a <= cic + 1;
            bt2_ra <= 0 * 32 + (cic + 1);
            st <= S_GAP_FETCH;
          end else begin
            cic <= 0;
            st <= S_HD_BIAS;
          end
        end

        S_HD_BIAS: begin
          r_hd_b_a <= coc;
          cic <= 0;
          r_hd_k_a <= coc;
          bg_ra <= 0;
          st <= S_HD_WAIT;
        end

        S_HD_WAIT: st <= S_HD_MAC;

        S_HD_MAC: begin
          if (cic == 0)
            acc <= $signed({{16{r_hd_b_q[15]}}, r_hd_b_q}) + (($signed(bg_do) * $signed(r_hd_k_q)) >>> 10);
          else
            acc <= acc + (($signed(bg_do) * $signed(r_hd_k_q)) >>> 10);
          if (cic < 31) begin
            cic <= cic + 1;
            r_hd_k_a <= (cic+1) * 32 + coc;
            bg_ra <= cic + 1;
            st <= S_HD_WAIT;
          end else begin
            st <= S_HD_MAC_LAST;
            cic <= 0;
          end
        end

        S_HD_MAC_LAST: begin
          st <= S_HD_WR;
        end

        S_HD_WR: begin
          bh_we <= 1; bh_wa <= coc; bh_di <= relu16(sat16(acc));
          if (coc < 31) begin coc <= coc+1; st <= S_HD_BIAS; end
          else begin coc <= 0; st <= S_OUT_BIAS;
            best_s <= 16'sh8000; best_c <= 0; end
        end

        S_OUT_BIAS: begin
          r_out_b_a <= ccl;
          cic <= 0;
          r_out_k_a <= ccl;
          bh_ra <= 0;
          st <= S_OUT_WAIT;
        end

        S_OUT_WAIT: st <= S_OUT_MAC;

        S_OUT_MAC: begin
          if (cic == 0)
            acc <= $signed({{16{r_out_b_q[15]}}, r_out_b_q}) + (($signed(bh_do) * $signed(r_out_k_q)) >>> 10);
          else
            acc <= acc + (($signed(bh_do) * $signed(r_out_k_q)) >>> 10);
          if (cic < 31) begin
            cic <= cic + 1;
            r_out_k_a <= (cic+1) * 11 + ccl;
            bh_ra <= cic + 1;
            st <= S_OUT_WAIT;
          end else begin
            st <= S_OUT_MAC_LAST;
            cic <= 0;
          end
        end

        S_OUT_MAC_LAST: begin
          st <= S_OUT_ARG;
        end

        S_OUT_ARG: begin
          if ($signed(sat16(acc)) > $signed(best_s)) begin
            best_s <= sat16(acc); best_c <= ccl[3:0]; end
          if (ccl < 10) begin ccl <= ccl+1; st <= S_OUT_BIAS; end
          else begin ccl <= 0; st <= S_OUT_DONE; end
        end

        S_OUT_DONE: begin
          valid_out <= 1'b1;
          class_out <= best_c;
          score_out <= best_s;
          st <= S_IDLE;
        end

        default: st <= S_IDLE;
      endcase
    end
  end

endmodule
