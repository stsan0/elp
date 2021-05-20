#Delete some un-needed files
rm *.o
rm *.out
rm *.lis

echo "Compile main.c"
gcc -c -Wall -m64 -no-pie -o main.o main.c -std=c++17 -g

echo "Compile isfloat.cpp"
gcc -c -Wall -m64 -no-pie -o isfloat.o isfloat.cpp -std=c++17 -g

echo "Compile control.asm"
nasm -f elf64 -l control.lis -o control.o control.asm -g -gdwarf

echo "Compile harmonic_mean.asm"
nasm -f elf64 -l sum.lis -o harmonic_mean.o harmonic_mean.asm -g -gdwarf

echo "Compile fill.asm"
nasm -f elf64 -l fill.lis -o fill.o fill.asm -g -gdwarf

echo "Compile display.cpp"
gcc -c -Wall -m64 -no-pie -o display.o display.cpp -std=c++17 -g

echo "Link the object files"
gcc -m64 -no-pie -o harmonic_mean.out -std=c++17 main.o control.o isfloat.o fill.o harmonic_mean.o display.o -g

echo "Run the program assign3:"
gdb ./harmonic_mean.out

echo "Delete some un-needed files"
rm *.o
rm *.lis

echo "The script file will terminate"
