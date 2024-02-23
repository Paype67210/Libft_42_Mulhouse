# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: pdeson <pdeson@student.42mulhouse.fr>      +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/02/23 14:53:19 by pdeson            #+#    #+#              #
#    Updated: 2024/02/23 14:57:01 by pdeson           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NC              := \033[0m
B_RED           := \033[1;31m
RED             := \033[0;31m
B_GREEN         := \033[1;32m
GREEN           := \033[0;32m
B_BLUE          := \033[1;34m
BLUE            := \033[0;34m
PURPLE          := \033[0;35m
B_PURPLE        := \033[1;35m

NAME = libft.a
HEADERS = libft.h
DIR_OBJS = .objs/
SRCES_PATH = srces/
CC = @gcc -DM
FLAGS = -Wall -Wextra -Werror
AR = @ar -rcs
RM = @rm -rf

# Creation of sources
SRC =	ft_memset.c ft_bzero.c ft_memcpy.c ft_memmove.c ft_isalpha.c ft_isalnum.c \
		ft_isdigit.c ft_isascii.c ft_isprint.c ft_strlen.c ft_strlcpy.c ft_strlcat.c \
		ft_tolower.c ft_toupper.c ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c \
		ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c ft_strdup.c ft_substr.c \
		ft_strjoin.c ft_strtrim.c ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c \
		ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c \
		ft_lstnew_bonus.c ft_lstmap_bonus.c ft_lstadd_front_bonus.c ft_lstsize_bonus.c \
		ft_lstadd_back_bonus.c ft_lstdelone_bonus.c ft_lstclear_bonus.c \
		ft_lstiter_bonus.c ft_lstlast_bonus.c
SRCES = $(addprefix $(SRCES_PATH), $(SRC))

# Generate a list of object files
LIST_OBJS = $(SRC:.c=.o)
OBJS = $(addprefix $(DIR_OBJS), $(LIST_OBJS))

all: $(NAME)

# Use a pattern rule to compile source files to object files
$(DIR_OBJS)%.o: $(SRCES_PATH)%.c
	@echo "$(GREEN)Compiling:$(B_GREEN) $< $(NC)"
	@mkdir -p $(DIR_OBJS)
	$(CC) $(FLAGS) -c $< -o $@ -I .

# Create the library
$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)
	@ranlib $(NAME)
	@echo "$(BLUE)Libft compiled!$(NC)"

# Don't Relink
$(OBJS): $(HEADERS)

clean:
	$(RM) $(DIR_OBJS)
	@echo "$(B_RED)libft objects files cleaned!$(NC)"

fclean:	clean
	$(RM) $(NAME)
	@echo "$(B_RED)libft executable files cleaned!$(NC)"

re: fclean all
	@echo "$(B_PURPLE)Cleaned and rebuilt everything for libft!$(NC)"

norm:
	@echo "$(GREEN)Verification of norminette compatibility...$(NC)"
	@norminette $(SRCES) $(HEADERS) | grep -v Norme -B1 || true

$(DIR_OBJS):
	mkdir -p $(DIR_OBJS)

.PHONY : all norm clean fclean re
