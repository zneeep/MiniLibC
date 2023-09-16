##
## EPITECH PROJECT, 2018
## asm minilibc
## File description:
## Makefile for asm minlibc
##

ASM	=	nasm -f elf64

CC	=	gcc

RM	=	rm -f

NAME	=	libasm.so

SRCS	=	src/strlen.asm		\
		src/strchr.asm		\
		src/memset.asm		\
		src/memcpy.asm		\
		src/strcmp.asm		\
		src/strncmp.asm		\
		src/strcasecmp.asm	\
		src/strcspn.asm		\
		src/strpbrk.asm		\
		src/strstr.asm

OBJ	=	$(SRCS:.asm=.o)

all:		$(NAME)

$(NAME):	$(OBJ)
		$(CC) -nostdlib -shared -fPIC $(OBJ) -o $(NAME)

%.o : %.asm
		$(ASM) -o $@ $<

clean:
		$(RM) $(OBJ)

fclean:		clean
		$(RM) $(NAME)

re:		fclean all

.PHONY:		all clean fclean re