#include<stdio.h>
#include<alloc.h>
#include<conio.h>
#include<stdlib.h>

struct SET
{
  float nr[5];
  float dr[5];
  int n;
};

typedef struct SET fuzzy;

void getval(fuzzy *m,char *x)
{
   int i;
   float f;
   clrscr();
   printf("\n Enter the %s:\n",x);
   for(i=0;i<m->n;i++)
   {
      printf(" Numerator Element %d :",i+1);
      scanf("%f",&f);
      m->nr[i]=f;
      fflush(stdin);
      printf(" Denominator Element %d:",i+1);
      scanf("%f",&f);
      m->dr[i]=f;
   }
}

void printval(fuzzy *m,char *x)
{
   int i;
   printf("\n %s={",x);
   for(i=0;i<m->n;i++)
   {
     printf(" %6.2f / %6.2f",m->nr[i],m->dr[i]);
     if(i!=m->n-1) putch('+');
   }
   printf(" }");
}

fuzzy unionset(fuzzy a,fuzzy b)
{
   fuzzy temp;
   char ch;
   int i;
   temp.n=a.n;
   for(i=0;i<a.n;i++)
   {
     if(a.dr[i]!=b.dr[i])
      {
	 printf("\n Denominators not equal");
	 getch();
	 exit(0);
      }
     if(a.nr[i]<b.nr[i])
	 temp.nr[i]=b.nr[i];
     else
	 temp.nr[i]=a.nr[i];
     temp.dr[i]=a.dr[i];
   }
   return temp;
}

fuzzy intersect(fuzzy a,fuzzy b)
{
   fuzzy temp;
   int i;
   temp.n=a.n;
   for(i=0;i<a.n;i++)
   {
     if(a.dr[i]!=b.dr[i])
      {
	 printf("\n Denominators not equal");
	 getch();
	 exit(0);
      }
     if(a.nr[i]>b.nr[i])
	 temp.nr[i]=b.nr[i];
     else
	 temp.nr[i]=a.nr[i];
     temp.dr[i]=a.dr[i];
   }
   return temp;
}

fuzzy complement(fuzzy a)
{
  fuzzy temp;
  int i;
  temp.n=a.n;
  for(i=0;i<a.n;i++)
  {
    temp.nr[i]=1-a.nr[i];
    temp.dr[i]=a.dr[i];
  }
  return temp;
}

void main()
{
   fuzzy a,b,temp1,temp2,ans;
   char ch;
   clrscr();
   printf("\n Enter the no of componets:");
   scanf("%d",&a.n);
   b.n=a.n;
   getval(&a,"A");
   getval(&b,"B");
   clrscr();
   printval(&a,"A");
   printval(&b,"B");
   getch();
   while(1)
   {
     clrscr();
     printf("\n Menu:\n 1.Difference A/B \n 2.Difference B/A\n 3.DeMorgan's law -1\n 4.DeMorgan's law -2\n 5.Excluded Middle laws\n 6.Print S,A,B\n 7.Exit");
     switch((ch=getch()))
     {
       case '1':
	   temp1=complement(b);
	   printval(&temp1,"B~");
	   printval(&a,"A");
	   ans=intersect(a,temp1);
	   printval(&ans,"A/B = A^ B~");
	   getch();
	   break;
       case '2':
	   temp1=complement(a);
	   printval(&temp1,"A~");
	   printval(&b,"B");
	   ans=unionset(a,temp1);
	   printval(&ans,"A/B = B^ A~");
	   getch();
	   break;
       case '3':
	   ans=unionset(a,b);
	   ans=complement(ans);
	   printval(&ans,"(AUB)~");
	   temp1=complement(a);
	   temp2=complement(b);
	   printval(&temp1,"A~");
	   printval(&temp2,"B~");
	   ans=intersect(temp1,temp2);
	   printval(&ans,"A~ ^ B~");
	   getch();
	   break;
       case '4':
	   ans=intersect(a,b);
	   ans=complement(ans);
	   printval(&ans,"(A^B)~");
	   temp1=complement(a);
	   temp2=complement(b);
	   printval(&temp1,"A~");
	   printval(&temp2,"B~");
	   ans=unionset(temp1,temp2);
	   printval(&ans,"A~ U B~");
	   getch();
	   break;
       case '5':
	   ans=complement(a);
	   ans=unionset(ans,a);
	   printval(&ans,"A~ ^ A");
	   ans=complement(b);
	   ans=unionset(ans,b);
	   printval(&ans,"B~ ^ B");
	   getch();
	   break;
       case '6':
	   printval(&a,"A");
	   printval(&b,"B");
	   getch();
	   break;
       case '7':
	   exit(0);
     }
   }
}