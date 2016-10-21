#include<iostream>
#include<vector>
#include<cstdio>
#include<algorithm>
#include<map>
#include<string>
using namespace std;

struct kapil
{
    int time_to_fill,index,time_filled;

};

long long abs(long long size_packet,long long x)
{
size_packet=size_packet+9;
if(size_packet%x!=0)
{
return (size_packet/x)+1;
}
return (size_packet/x);
}

int main()
{
long long size_packet = 72;
// cin>>size_packet;

for(long long time_process=1;time_process<=size_packet+9;time_process++){
   long long ideal_time_lane=0,ideal_time_io=0,words=0,curr_time=0,last_index=3;

   vector<kapil> v(4);
   vector<int>  no_of_words(4,1);

   int i,j;


   for(i=0;i<4;i++)
   {
       v[i].index=i;
   }
   v[0].time_to_fill=abs(size_packet,18);
   v[1].time_to_fill=abs(size_packet,8);
   v[2].time_to_fill=abs(size_packet,4);
   v[3].time_to_fill=abs(size_packet,4);

   v[0].time_filled=abs(size_packet,18);
   v[1].time_filled=abs(size_packet,8);
   v[2].time_filled=abs(size_packet,4);
   v[3].time_filled=abs(size_packet,4);
   int c=100000;

   for(;curr_time<c;)
   {
    // cout<<curr_time<<endl;
       int c=0;
       for(i=0,j=last_index+1;i<4;j++,i++)
       {
           j=j%4;
           if(v[j].time_filled<=curr_time)
           {     //cout<<ideal_time_lane<<endl;
               //cout<<j<<" "<<v[j].time_filled<<" lol "<<curr_time<<endl;
               c=1;
               ideal_time_lane=ideal_time_lane+curr_time-v[j].time_filled;
               words++;
               no_of_words[j]++;
               curr_time=curr_time+time_process;
               last_index=j;
               v[j].time_filled=curr_time+v[j].time_to_fill;
              // cout<<j<<" "<<curr_time<<" lol "<<v[0].time_filled<<" "<<v[1].time_filled<<" "<<v[2].time_filled<<" "<<v[3].time_filled<<" aloha "<<ideal_time_lane<<endl;
               break;
           }

       }
       if(c==0)
       {
           curr_time++;
       }
   }

   double a,b;
   long long ideal_time_lane_2;

   ideal_time_lane_2=4*c-(no_of_words[0]*v[0].time_to_fill+no_of_words[1]*v[1].time_to_fill+no_of_words[2]*v[2].time_to_fill+no_of_words[3]*v[3].time_to_fill);

   a=ideal_time_lane_2*1.00/(4*c);
   b=words*time_process*1.00/c;
   b=1-b;
   if(b<0)
   {
   b=0;
   }
   cout<<time_process<<" "<<1-a<<" "<<1-b<<endl;
   }

 return 0;
}
