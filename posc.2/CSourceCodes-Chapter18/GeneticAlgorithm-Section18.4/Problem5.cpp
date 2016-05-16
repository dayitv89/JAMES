
#include <stdio.h>
#include <conio.h>
#include <dos.h>
#include <math.h>
#include <stdlib.h>
#include <time.h>
int f(int);
void main()
{
  struct c{
    int chromosome[5];
    int decimal_val;
    int fittness;
  };
  struct c ipop[10], newpop[10];
  int i,j,cut,gen,t,flag,num,s1,s2;
  clrscr();

  /* generating Initial population */
  randomize();
  for(i=0;i<10; ++i)
   for(j=0; j<5; ++j)
     ipop[i].chromosome[j] = rand()%2;

  /* start of the next generation */
  gen=1;
  while(1)
  {
  /* Converting a binary string into decimal value */
  for(i=0;i<10; ++i)
  {
     num=0;
     for(j=0;j<4;++j)
       num = num+ (ipop[i].chromosome[j] * pow(2,j));
     num = num-(ipop[i].chromosome[4]*pow(2,4));
     ipop[i].decimal_val = num;
   }

   /* Calculating fittness value */
   for(i=0;i<10;++i)
     ipop[i].fittness = f(ipop[i].decimal_val);
   printf("Generation- %1d\n", gen);
   printf("Initial population- output\n");
   for(i=0;i<10;++i)
   {
     for(j=4; j>=0; --j)
       printf("%1d", ipop[i].chromosome[j]);
     printf("   %d", ipop[i].decimal_val);
     printf("   %d", ipop[i].fittness);
     printf("\n");
    }
    for(i=0;i<10; ++i)
    {
       if(ipop[i].fittness ==0)
       {
	  printf("stop generations\n");
	  printf("result = %d\n", ipop[i].decimal_val);
	  goto l1;
	}
     }


   /* tournament selection */
   printf("tournament selection\n ");
   i=0;
   while(i<=9)
   {
      s1 = rand()%10;
      s2 = rand()%10;
      printf("%d  %d  %d  %d\n", s1,s2,ipop[s1].fittness, ipop[s2].fittness);
      getche();
      if( ipop[s1].fittness < ipop[s2].fittness)
      {
	 for(j=0;j<5;++j)
	 newpop[i].chromosome[j] = ipop[s1].chromosome[j];
      }
      else
      {
	 for(j=0;j<5;++j)
	 newpop[i].chromosome[j] = ipop[s2].chromosome[j];
      }
      i++;

    }
   getche();


   printf("new population -output\n");
   for(i=0;i<10;++i)
   {
     for(j=4; j>=0; --j)
       printf("%1d", newpop[i].chromosome[j]);
     printf("\n");
    }
    getche();

    /*crossover operation */
    printf("crossover operation\n");
    printf("left/right cut-point position\n");
    for(i=0;i<=4;++i)
    {
       flag= rand()%2;
       cut= rand()%5;
       printf("%1d        %1d\n", flag, cut);
       if(flag==0)      /* crossover to left of cutpoint position*/
	  for(j=0;j<=cut-1;++j)
	  {
	     t=newpop[2*i].chromosome[j];
	     newpop[2*i].chromosome[j]= newpop[(2*i+1)].chromosome[j];
	     newpop[(2*i+1)].chromosome[j]= t;
	  }
       else          /* crossover to the right of cutpoint position*/
	 for(j=cut+1;j<=4;++j)
	  {
	     t=newpop[2*i].chromosome[j];
	     newpop[2*i].chromosome[j]= newpop[(2*i+1)].chromosome[j];
	     newpop[(2*i+1)].chromosome[j]= t;
	  }
	for(j=4; j>=0; --j)
	 printf("%1d", newpop[2*i].chromosome[j]);
	 printf("\n");
	for(j=4; j>=0; --j)
	 printf("%1d", newpop[2*i+1].chromosome[j]);
	 printf("\n");
    }

    /* copy newpopulation to initial population*/
    for(i=0; i<10; ++i)
    {
       for(j=0; j<5;++j)
	ipop[i].chromosome[j] = newpop[i].chromosome[j];
    }
    gen=gen+1;
  }
  l1:
    printf("end\n");
}
int f(int x)
{
  return ( x*x + 5*x + 6);
}





