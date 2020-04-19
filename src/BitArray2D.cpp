//    Battleship game assignment for MSU CSCI 366
//    Copyright (C) 2020    Mike P. Wittie
//
//    This program is free software: you can redistribute it and/or modify
//    it under the terms of the GNU General Public License as published by
//    the Free Software Foundation, either version 3 of the License, or
//    (at your option) any later version.
//
//    This program is distributed in the hope that it will be useful,
//    but WITHOUT ANY WARRANTY; without even the implied warranty of
//    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//    GNU General Public License for more details.
//
//    You should have received a copy of the GNU General Public License
//    along with this program.  If not, see <https://www.gnu.org/licenses/>.

#include <math.h>
#include "BitArray2D.hpp"
#include "common.hpp"

BitArray2D::BitArray2D(unsigned int rows, unsigned int columns) {
    int totalBits = rows * columns;
    int totalChars;

    if (totalBits < 1) {
        throw "Bad board size";
    }

    totalChars = totalBits / 8;
    if (totalBits % 8 != 0) {
        totalChars++;
    }

    array = new char[totalChars];
}


BitArray2D::~BitArray2D() {

}


bool BitArray2D::get(unsigned int row, unsigned int column){
   // check array bounds
   if (row >= BOARD_SIZE || row < 0) { // Check X coord
       throw "X out of bounds!";
   } else if (column >= BOARD_SIZE || column < 0) { // Check Y coord
       throw "Y out of bounds!";
   }

   // get the element
   return get_bit_elem(array, columns, row, column);
}



void BitArray2D::set(unsigned int row, unsigned int column){
   // check array bounds
   if (row >= BOARD_SIZE || row < 0) { // Check X coord
       throw "X out of bounds!";
   } else if (column >= BOARD_SIZE || column < 0) { // Check Y coord
       throw "Y out of bounds!";
   }

   // set the element
   set_bit_elem(array, columns, row, column);
}