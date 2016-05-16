#include<stdio.h>
#include<limits.h>
#include<alloc.h>
#include<conio.h>
#include<stdlib.h>

#define min(x,y) (x<y ? x : y)

struct SET
{
  float nr[5];
  float dr[5];
  int n;
};

typedef struct SET fuzzy;

void printval(fuzzy *m,char *x)
{
   int i;
   printf("\n %s={",x);
   for(i=0;i<m->n;i++)
   {
     printf(" %5.2f /%5.2f ",m->nr[i],m->dr[i]);
     if(i!=m->n-1) putch('+');
   }
   printf(" }");
}

void main()
{
   fuzzy V,I;
   int i,j;
   float P[6][6];

   clrscr();

   V.n=I.n=5;
   V.nr[0]=0.2;     V.dr[0]=30;
   V.nr[1]=0.8;     V.dr[1]=45;
   V.nr[2]=1;       V.dr[2]=60;
   V.nr[3]=0.9;     V.dr[3]=75;
   V.nr[4]=0.7;     V.dr[4]=90;

   I.nr[0]=0.4;     I.dr[0]=0.8;
   I.nr[1]=0.7;     I.dr[1]=0.9;
   I.nr[2]=1;       I.dr[2]=1;
   I.nr[3]=0.8;     I.dr[3]=1.1;
   I.nr[4]=0.6;     I.dr[4]=1.2;

   printval(&V,"V");
   printval(&I,"I");
   printf("\n");

   for(i=0;i<=V.n;i++)
     for(j=0;j<=I.n;j++)
     {
       if(i==0 && j>0)
	  P[i][j]=I.dr[j-1];
       else if(j==0 && i>0)
	  P[i][j]=V.dr[i-1];
       else if(i>0 && j>0)
	  P[i][j]=min(V.nr[i-1],I.nr[j-1]);
     }

   for(i=0;i<=V.n;i++)
   {
     for(j=0;j<=I.n;j++)
     {
       if(i==0 && j==0)
	  printf("        ");
       else
	  printf(" %6.2f ",P[i][j]);
     }
     printf("\n");
   }
   getch();
}