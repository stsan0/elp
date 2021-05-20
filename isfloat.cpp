//*****************************************************************************************************************************
//Program name: "Harmonic Mean of float numbers in an Array".
//together.  Copyright (C) 2021 Kendrick Ngo                                                                                  *
//This program is free software: you can redistribute it and/or modify it under the terms of the GNU General Public License   *
//version 3 as published by the Free Software Foundation.                                                                     *
//This program is distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied          *
//Warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for more details.      *
//A copy of the GNU General Public License v3 is available here:  <https://www.gnu.org/licenses/>.                            *
//*****************************************************************************************************************************

// Author Info
// Name: Kendrick Ngo
// email: kendrickngo2000@csu.fullerton.edu

// Program Info
// Name: Harmonic Mean of Float numnbers in an Array
// Creation Date: 2021-May-20
// Completion Date: 2021-May-20
// files included: main.c, display.cpp, control.asm, fill.asm, script.sh, hmean.asm, isfloat.cpp

#include <cstdlib>
#include <ctype.h>

extern "C" bool isfloat(char[]);

bool isfloat(char w[]) {
  bool isNum = true;
  int oneDecimal = 0;

  int i = 0;
  if(w[0] == '+' || w[0] == '-') i++;

  while(w[i] != '\0' && isNum) {
    if(w[i] == '.' ) { oneDecimal++;}
    else {
      isNum = isNum && isdigit( w[i]);
    }
    i++;
  }
  return isNum && oneDecimal == 1;
}
