#include<stdio.h>
#include<limits.h>
#include<alloc.h>
#include<conio.h>
#include<stdlib.h>

#define product(x,y) ((x)*(y))
#define min(x,y) (x<y ? x: y)

struct SET
{
  float nr[10];
  float dr[10];
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
   fuzzy V,I,C;
   int i,j,k,prows,pcols,trows,tcols;
   float P[6][7],T[7][4],E[6][4],M[6][4],max;

   clrscr();

   V.n=5; I.n=6; C.n=3;
   V.nr[0]=0.1;     V.dr[0]=2.98;
   V.nr[1]=0.3;     V.dr[1]=2.99;
   V.nr[2]=0.7;     V.dr[2]=3;
   V.nr[3]=0.4;     V.dr[3]=3.01;
   V.nr[4]=0.2;     V.dr[4]=3.02;

   I.nr[0]=0.1;     I.dr[0]=0.05;
   I.nr[1]=0.3;     I.dr[1]=0.06;
   I.nr[2]=0.3;     I.dr[2]=0.07;
   I.nr[3]=0.4;     I.dr[3]=0.08;
   I.nr[4]=0.5;     I.dr[4]=0.09;
   I.nr[5]=0.2;     I.dr[5]=0.1;

   C.nr[0]=0.1;     C.dr[0]=0;
   C.nr[1]=0.7;     C.dr[1]=0.5;
   C.nr[2]=0.3;     C.dr[2]=1;

   printval(&V,"V");
   printval(&I,"I");
   printval(&C,"C");
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

   for(i=0;i<=I.n;i++)
     for(j=0;j<=C.n;j++)
     {
       if(i==0 && j>0)
	  T[i][j]=C.dr[j-1];
       else if(j==0 && i>0)
	  T[i][j]=I.dr[i-1];
       else if(i>0 && j>0)
	  T[i][j]=min(I.nr[i-1],C.nr[j-1]);
     }
   printf("\n T\n");

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
   printf("\n E\n");
   for(i=0;i<=I.n;i++)
   {
     for(j=0;j<=C.n;j++)
     {
       if(i==0 && j==0)
	  printf("        ");
       else
	  printf(" %6.2f ",T[i][j]);
     }
     printf("\n");
   }

   getch();
   clrscr();

   prows=6,pcols=7;
   trows=7,tcols=4;
   for(i=0;i<prows;i++)
   {
     for(j=0;j<tcols;j++)
     {
       if(i==0 && j==0)
	   E[i][j]=0;
       else if(i==0 && j>0)
	   E[i][j]=T[i][j];
       else if(i>0 && j==0)
	   E[i][j]=P[i][j];
       else
       {
	 max=0;
	 for(k=1;k<pcols;k++)
	 {
	   if(i>0 && j>0)
	     if(max < product(P[i][k],T[k][j]))
		max=product(P[i][k],T[k][j]);
	  }
	 if(i>0 && j>0)
	   E[i][j]=max;
       }
    }
  }

  printf("\n M=PoT(Max-Product)\n");
   for(i=0;i<prows;i++)
   {
     for(j=0;j<tcols;j++)
     {
       if(i==0 && j==0)
	  printf("        ");
       else
	  printf(" %6.2f ",E[i][j]);
     }
     printf("\n");
   }

  for(i=0;i<prows;i++)
  {
     for(j=0;j<tcols;j++)
     {
       if(i==0 && j==0)
	   M[i][j]=0;
       else if(i==0 && j>0)
	   M[i][j]=T[i][j];
       else if(i>0 && j==0)
	   M[i][j]=P[i][j];
       else
       {
	 max=0;
	 for(k=1;k<pcols;k++)
	 {
	   if(i>0 && j>0)
	     if(max < min(P[i][k],T[k][j]))
		max=min(P[i][k],T[k][j]);
	  }
	 if(i>0 && j>0)
	   M[i][j]=max;
       }
    }
  }
   printf("\n M=PoT(Max-Min)\n");
   for(i=0;i<prows;i++)
   {
     for(j=0;j<tcols;j++)
     {
       if(i==0 && j==0)
	  printf("        ");
       else
	  printf(" %6.2f ",M[i][j]);
     }
     printf("\n");
   }
   getch();
}