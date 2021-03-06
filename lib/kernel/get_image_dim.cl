/* OpenCL built-in library: get_image_dim()

   Copyright (c) 2013-2014 Ville Korhonen, Pekka Jääskeläinen
                           Tampere University of Technology
   Copyright (c) 2015      Giuseppe Bilotta

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
   THE SOFTWARE.
*/

#include "templates.h"

#if (__clang_major__ == 3) && (__clang_minor__ >= 5)
// Clang 3.5 crashes in case trying to cast to the private pointer,
// adding the global qualifier fixes it. Clang 3.4 crashes if it's
// there. The issue is in SROA.
#define ADDRESS_SPACE global
#else
#define ADDRESS_SPACE
#endif

int2 _CL_OVERLOADABLE get_image_dim(image2d_t image)
{
  ADDRESS_SPACE dev_image_t* img = *(ADDRESS_SPACE dev_image_t**)&image;
  return (int2)(img->width, img->height);
}

int2 _CL_OVERLOADABLE get_image_dim(image2d_array_t image)
{
  ADDRESS_SPACE dev_image_t* img = *(ADDRESS_SPACE dev_image_t**)&image;
  return (int2)(img->width, img->height);
}

int4 _CL_OVERLOADABLE get_image_dim(image3d_t image)
{
  ADDRESS_SPACE dev_image_t* img = *(ADDRESS_SPACE dev_image_t**)&image;
  return (int4)(img->width, img->height, img->depth, 0);
}
