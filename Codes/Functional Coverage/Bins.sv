
module bins ();

logic [7:0] addr;
logic       wr_rd;

covergroup cg @(posedge clk);
c1: coverpoint addr { 

bins b1 = {0,2,7}; //increments for addr = 0,2 or 7

bins b2[3] = {[11:20]};  //creates three bins b2[0],b2[1] and b2[3] distributed as follows: (11,12,13),(14,15,16) and (17,18,19,20)

ignore_bins b3  = {[30:40],[50:60],77}; //bin for addr = 30-40 or 50-60 or 77 values to exclude from functional coverage calculation

bins b4[] = {[79:99],[110:130],140}; //creates 43 bins

ignore_bins b5[] = {1,2}; // These values will NOT be counted in coverage (hits are not required). 

illegal_bins b6[] = {160,170,180}; //creates three bins b5[0],b5[1] and b5[3] with values 160,170 and 180 cause run time error, but dosent stop the simulation

bins b7[] = {150,162,185,166};

bins b8[] = {150,170,185,198};//Overlapping Example (not repeat in the report any overlap value)

bins b9  = {[200:$]}; //increments for addr = 200 to max value i.e, 255.

bins b10[] = default;} // catches the values of the coverage point that do not lie within any of the defined bins.

c2: coverpoint wr_rd; //2 bins created automatically
endgroup : cg

covergroup cg @(posedge clk);
c1: coverpoint addr
{ 
bins b1  = (10=>20=>30);// transition from 10->20->30

bins b2[] = (40=>50),(80=>90=>100=>120); // b2[0] = 40->50 and b2[1] = 80->90->100->120

bins b3 = (1,5 => 6, 7); // b3 = 1=>6 or 1=>7 or 5=>6 or 5=>7

bins b4 = (1=>6) ,(1=>7) ,(5=>6) ,(5=>7);

bins b5 = (0=>1[*2]=>2); //0=>1=>1=>2

bins b6[] = (0=>1[->2]=>2);//0=>...1=>...1=>2

bins b7[] = (0=>1[=2]=>2);//0=>...1=>...1=>...2
}
endgroup : cg



endmodule