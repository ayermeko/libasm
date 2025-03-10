
NAME		=	libasm.a
CC 			=	cc
SRC			=	ft_strlen.s \
				ft_strcpy.s \
				ft_strcmp.s
SRC_O		=	$(SRC:.s=.o)
FLAGS		=	-Wall -Wextra -Werror
ASM_FLAGS 	= 	-f elf64
TEST		=	test

all: $(NAME)

$(NAME): $(SRC_O)
	@ar rcs $(NAME) $(SRC_O)

%.o: %.s
	@nasm $(ASM_FLAGS) -o $@ $<

clean:
	@echo "Cleaning all .s files"
	@rm -f $(SRC_O)

fclean: clean
	@echo "cleaning all .a files"
	@rm -f $(NAME)
	@rm -f $(TEST)

test: $(NAME) main.c
	@$(CC) $(FLAGS) main.c $(NAME) -o $(TEST)

re: fclean all

.PHONY: all clean fclean re