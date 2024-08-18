# MIT License
# 
# Copyright (c) Microsoft Corporation
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy of this
# software and associated documentation files (the "Software"), to deal in the Software
# without restriction, including without limitation the rights to use, copy, modify,
# merge, publish, distribute, sublicense, and/or sell copies of the Software, and to
# permit persons to whom the Software is furnished to do so, subject to the following
# conditions:
# 
# The above copyright notice and this permission notice shall be included in all copies
# or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF
# CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE
# OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

# Adapted version of this file:
# https://github.com/microsoft/vcpkg/blob/master/ports/directx-dxc/directx-dxc-config.cmake.in

get_filename_component(_dxc_root "${CMAKE_CURRENT_LIST_DIR}" PATH)

set(DIRECTX_DXC_TOOL "${_dxc_root}/tools/dxc.exe" CACHE PATH "Location of the dxc tool")
mark_as_advanced(DIRECTX_DXC_TOOL)

add_library(Microsoft::DirectXShaderCompiler SHARED IMPORTED)
set_target_properties(Microsoft::DirectXShaderCompiler PROPERTIES
   IMPORTED_LOCATION                    "${_dxc_root}/bin/dxcompiler.dll"
   IMPORTED_IMPLIB                      "${_dxc_root}/lib/dxcompiler.lib"
   IMPORTED_SONAME                      "dxcompiler.lib"
   INTERFACE_INCLUDE_DIRECTORIES        "${_dxc_root}/include"
   INTERFACE_LINK_LIBRARIES             "Microsoft::DXIL"
   IMPORTED_LINK_INTERFACE_LANGUAGES    "C")

add_library(Microsoft::DXIL SHARED IMPORTED)
set_target_properties(Microsoft::DXIL PROPERTIES
   IMPORTED_LOCATION                    "${_dxc_root}/bin/dxil.dll"
   IMPORTED_IMPLIB                      "${_dxc_root}/lib/dxcompiler.lib"
   IMPORTED_SONAME                      "dxcompiler.lib"
   INTERFACE_INCLUDE_DIRECTORIES        "${_dxc_root}/include"
   IMPORTED_LINK_INTERFACE_LANGUAGES    "C")

unset(_dxc_root)
