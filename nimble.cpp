//
//  main.cpp
//  nimble
//
//  Created by CLICC User on 4/15/18.
//  Copyright © 2018 CLICC User. All rights reserved.
//

#include <iostream>
#include <assert.h>
#include <string>


using namespace std;

void printStars(int start, int num) {
    for( int i(0);i<start;i++)
        cout << "  " ;
    for(int i(0);i<num;i++)
        cout << "*" << "   ";
    cout << endl;
}

int starLogic(int row, int length)
{
    if(row>=2*length) //if rows are more than desired size then end recursion
        return 0;
    int num = row;
    int start = length - row;
    if(row > length){   // if we are in the bottom half, re-calibrate parameters for printStars
        num=(2*length) - row;
        start = row - length;
    }
    printStars(start, num); //print the current row
    return num+starLogic(++row, length); //recurse to the next row and add the number of stars printed
}


int main(int argc, const char * argv[]) {

    int length;
    cout << "Please enter the length of the Diagonal\n";
    cin >> length;
    
    if(length<=0)
    {  cout << "Cannot print Diamond for negative input\n"; return 0; }
    else
       return starLogic(1,length); //return the total number of stars in the formation. 
    
}
