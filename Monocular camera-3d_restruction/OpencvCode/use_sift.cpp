    #include "opencv2/core/core.hpp"  
    #include "highgui.h"  
    #include "opencv2/imgproc/imgproc.hpp"  
    #include "opencv2/features2d/features2d.hpp"  
    #include "opencv2/nonfree/nonfree.hpp"  
    #include "opencv2/legacy/legacy.hpp"  
      
#include <iostream>
#include <fstream>

    using namespace cv;  
    using namespace std;  
      
    int main(int argc, char** argv)  
    {  
		ofstream fout("info_result.txt");
       //待匹配的两幅图像，其中img1包括img2，也就是要从img1中识别出img2  
       Mat img1 = imread("paper01.png");  
       Mat img2 = imread("paper02.png");  
      
       SIFT sift1, sift2;  
      
       vector<KeyPoint> key_points1, key_points2;  
      
       Mat descriptors1, descriptors2, mascara;  
      
       sift1(img1,mascara,key_points1,descriptors1);  
       sift2(img2,mascara,key_points2,descriptors2);  
         
       //实例化暴力匹配器——BruteForceMatcher  
       BruteForceMatcher<L2<float>> matcher;    
       //定义匹配器算子  
       vector<DMatch>matches;    
       //实现描述符之间的匹配，得到算子matches  
       matcher.match(descriptors1,descriptors2,matches);  
      
       //提取出前30个最佳匹配结果  
       std::nth_element(matches.begin(),     //匹配器算子的初始位置  
           matches.begin()+29,     // 排序的数量  
           matches.end());       // 结束位置  
       //剔除掉其余的匹配结果  
       matches.erase(matches.begin()+30, matches.end());  
      
       namedWindow("SIFT_matches");    
       Mat img_matches;    
       //在输出图像中绘制匹配结果  
       drawMatches(img1,key_points1,         //第一幅图像和它的特征点  
           img2,key_points2,      //第二幅图像和它的特征点  
           matches,       //匹配器算子  
           img_matches,      //匹配输出图像  
           Scalar(255,255,255));     //用白色直线连接两幅图像中的特征点  
	   for(int i=0;i<30;i++){
	   fout<<"kp1: "<<key_points1[matches[i].queryIdx].pt<<endl;
	   }
	   fout<<" --- "<<endl;
	   for(int i=0;i<30;i++){
		   fout<<"kp2: "<<key_points2[matches[i].trainIdx].pt<<endl;
	   }
	   
	   
	   fout.close();
       imshow("SIFT_matches",img_matches);    
       waitKey(0);  
      
       return 0;  
    }  