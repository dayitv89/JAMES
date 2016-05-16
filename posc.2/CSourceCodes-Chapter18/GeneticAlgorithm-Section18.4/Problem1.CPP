#include<stdio.h>
#include<conio.h>
#include<dos.h>
#include<stdlib.h>
#include<math.h>
float mutation(float ,int );
void main()
{
float x1[10],x2[10],sum[10],max_val=0.0,a,max_x1,max_x2;
int flag=0,j,i,k;
clrscr();
randomize();
printf("\tInitial Population   \n");
for(i=0;i<4;i++)
{
x1[i]=(float)(random(1000.0))/500.0;
x2[i]=(float)(random(1000.0))/500.0;
printf("\t%d\tx1 : %f\tx2 : %f\n",i,x1[i],x2[i]);
}

for(i=0;i<10
;i++)
{
for(j=0;j<4;j++)
{
flag=0;
if(((2*x1[j])+(3*x2[j]))<=6)
{
	if(((-3*x1[j])+(2*x2[j]))<=3)
	{
		if(((2*x1[j])+(x2[j]))<=4)
		{
		 flag=1;
		 sum[j]=(4*x1[j])+(3*x2[j]);
		}
	}
}
if(flag==0)
sum[j]=0;
}
	printf("\t   After %d geration\n",i);
	for(k=0;k<4;k++)
	{
		printf("\t%d\tx1 : %f\tx2 : %f\tsum : %f\n",k,x1[k],x2[k],sum[k]);
	}
	for(k=0;k<4;k++)
	{
		if(max_val<sum[k])
		{
			max_val=sum[k];
			max_x1=x1[k];
			max_x2=x2[k];

		}
	}
	printf("\tx1 : %f\tx2 : %f\tMax : %f\n",max_x1,max_x2,max_val);
	getch();
	for(k=0;k<3;k++)
	{
		//cross over operation
		a=(float)(random(1000.0))/1000.0;
		x1[k]=((a*x1[k])+(1-a)*x2[k+1]);
		x2[k]=((a*x2[k])+(1-a)*x1[k+1]);
	}
	a=(float)(random(1000.0))/1000.0;
	x1[4]=((a*x1[4])+(1-a)*x2[1]);
	x2[4]=((a*x2[4])+(1-a)*x1[1]);
	for(k=0;k<4;k++)
	{
		if(sum[k]==0)
		{
		x1[k]=(x1[0]+x1[1]+x1[2]+x1[3])/4.0;
		x1[k]=(x2[0]+x2[1]+x2[2]+x2[3])/4.0;
		}
		if(sum[k]==sum[k+1])
		{

		x1[k]=(float)(random(1000.0))/500.0;
		x2[k]=(float)(random(1000.0))/500.0;
		}
		if(x1[k]<.5)
		{
		x1[k]=x1[k]+1.0;
		}
		if(x2[k]<.5)
		{
		x2[k]=x2[k]+0.5;
		}
	}

}
clrscr();
printf("\tTHE SOLUTION OF THE FOLLOWING PROBLEM IS\n");
printf("\n\tSUM:\tMAXIMIZE\tF(x1,x2) : 4x1+3x2");
printf("\n\n\t2*x1+3*x2<=6\n\t-3*x1+2*x2<=3\n\t2*x1+x2<=4\n");
printf("\n\tx1 : %f\tx2 : %f\tMax : %f\n",max_x1,max_x2,max_val);
getch();
}




void cross_over(float x1,float x2)
{
	int a;
	a=(float)(random(1000))/1000;
	x1=((a*x1)+(1-a)*x2);
	x2=((a*x2)+(1-a)*x1);
}
float mutation(float x,int i)
{

}
/*float max(float sum)
{
int i;
for(i=0;i<3;i++)
{
if(sum[i]<sum[i+1])
max=sum[i+1];
else
max=sum[i];
return max;
} */
