#include <stdio.h>
#include <stdlib.h>
#define PI 3.1415926
float Max(float temp[],int length);
int main()
{
    int m=0,n=0,i=0;
    float fs=44100;
    float ff=0;
    float F[21]={131,147,165,175,196,220,247,262,294,330,349,392,440,494,524,588,660,698,784,880,988};
    float f[7]={1,1.1225602048,1.25992105,1.334839854,1.498307077,1.681792831,1.887748625};
    float deltaT=1/fs;
    float v=0;
    float max;
    float temp[337];
    float fv[7][12]={{752.38,299.85,160.05,158.04,152.05,33.866,95.273,36.524,93.016,116.19,24.278,26.723},
                     {769.81,456.5,267.9,166.6,117.6,22.24,69.48,72.79,22.65,69.60,40.11,20.06},
                     {702.64,480.91,217.60,81.117,85.149,20.233,52.871,46.880,34.471,68.935,56.611,20.516},
                      {717.22,436.6,264.2,192.9,98.04,25.30,86.96,78.05,20.22,62.09,50.00,15.83},
                      {596.06,349.71,148.59,68.354,47.422,225.19,30.463,13.897,43.981,10.066,21.808,30.115},
    {608.70,343.98,208.57,53.658,58.518,226.80,26.878,16.067,50.345,10.056,21.970,41.056},
    {639.71,500.02,139.84,204.31,265.32,109.75,62.149,37.604,9.1493,6.5117,19.793,26.345}};


    for(i=0;i<7;i++)
    {
        FILE*fp;
        ff=F[i]*f[6];
        switch(i)
        {
            case 0:fp=fopen("SineTable-B-low1.dat","w+");
                    break;
            case 1:fp=fopen("SineTable-B-low2.dat","w+");
                   break;
            case 2:fp=fopen("SineTable-B-low3.dat","w+");
                  break;
            case 3:fp=fopen("SineTable-B-low4.dat","w+");
            break;
            case 4:fp=fopen("SineTable-B-low5.dat","w+");
            break;
            case 5:fp=fopen("SineTable-B-low6.dat","w+");
            break;
            case 6:fp=fopen("SineTable-B-low7.dat","w+");
            break;

        }
        if(fp==NULL)
        {
             printf("Can't open file!\n");
        }
        else
        {
          printf("Successfully\n");
          for(n=0;n<=fs/ff;n++)
          {
              v=0;
              for(m=0;m<12;m++)
              {
                  v=v+fv[i][m]*(1+sin(2*PI*(m+1)*ff*n/fs));
              }
            temp[n]=(int)(v);
           //printf("%f\t %d  %d\n ",v,n,(int)(temp[n]));
           // fprintf(fp,"@%04x\t \t%x\n",n+1,temp);
          }
          max=Max(temp,((int)(fs/ff))+1);
          for(n=0;n<=fs/ff;n++)
          {

                  temp[n]=255*temp[n]/max;

              fprintf(fp,"@%04x\t \t%x\n",n+1,(int)(temp[n]));
          }
          fclose(fp);
        }

    }


    return 0;
}
float Max(float temp[],int length)
{
  int i=0;
  float max=temp[0];
  for(i=0;i<length;i++)
  {
      if(temp[i]>max)
      {
          max=temp[i];
      }
  }
  return max;
}
