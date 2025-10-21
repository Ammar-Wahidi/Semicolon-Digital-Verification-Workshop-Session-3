module top();
int queue_1[$];    // queue of int 
string queue_2[$]; // queue of strings   
int K;

initial 
begin
queue_1 = {0,1,2,3}; 
queue_2 = {"Red" ,"Blue" ,"Green"};
$display("Queue_1 size is %0d ",queue_1.size());

queue_2.insert(1,"Orange"); //{"Red" ,"orange" ,"Blue" ,"Green"}
queue_2.delete(3); //{"Red" ,"orange" ,"Blue“}
queue_1.push_front(22);//{22,0,1,2,3}
queue_1.push_back(44);//{22,0,1,2,3,44}
K = queue_1.pop_front();//{0,1,2,3,44} K =22
K = queue_1.pop_back();//{0,1,2,3} K =44
queue_1.delete();
end

endmodule