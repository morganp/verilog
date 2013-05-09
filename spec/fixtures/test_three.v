module TEST_THREE(
  input rx,
  output tx
);


TEST_ONE test_one_i0(
  .rx  (rx),
  .tx  (tx)
);

TEST_TWO test_two_i0;

TEST_FOUR test_four_i0();

TEST_FIVE test_five_i0 ();

TEST_SIX #() test_six_i0 ( .rx(rx) );

TEST_SEVEN #() test_seven_i0 ();

TEST_EIGHT #( .W(8) ) test_eight_i0 ();

endmodule
