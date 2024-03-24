# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: lboiteux <lboiteux@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/15 13:00:22 by lboiteux          #+#    #+#              #
#    Updated: 2024/03/24 18:12:18 by lboiteux         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# **************************************************************************** #
# 								NAME PROJECT								   #
# **************************************************************************** #

NAME	=	libftprintf.a

# **************************************************************************** #
# 								  COMMANDS									   #
# **************************************************************************** #

LIBFT_DIR			=	./libft
LIBFT_NAME			= 	$(LIBFT_DIR)/libft.a

CC					=	@cc
CFLAGS				=	-Wall -Wextra -Werror -g
IFLAGS				=	-I ./includes -I $(LIBFT_DIR)/includes
MK					=	@mkdir -p
RM					= 	@rm -rf
FILE					=	$(shell ls -lR srcs/ | grep -F .c | wc -l)
PROJ_CMP			=	1
AR					= 	ar rcs

# **************************************************************************** #
#                                   COLORS                                     #
# **************************************************************************** #
COLOR_1	= \033[1;38;5;28m
COLOR_2	= \033[1;38;5;120m
COLOR_3	= \033[1;38;5;240m
COLOR_4	= \033[1;38;5;255m
COLOR_5	= \033[1;38;5;248m
RESET	= \033[0m

# **************************************************************************** #
#                                   PRINTS                                     #
# **************************************************************************** #

SRCS		:=	ft_printf.c \
					ft_printf_utils.c \
					ft_printf_nbr_utils.c \

SRCS_DIR	:=	srcs
SRCS		:=	$(SRCS:%=$(SRCS_DIR)/%)

# OBJECTS
OBJS_DIR	:=	.objs
OBJS		:=	$(addprefix $(OBJS_DIR)/, $(SRCS:%.c=%.o))

# **************************************************************************** #
# 								     RULES									   #
# **************************************************************************** #

all: $(NAME)

$(OBJS_DIR)/%.o: %.c
	$(MK) $(@D)
	$(CC) $(CFLAGS) $(IFLAGS) -c $< -o $@
	@if [ "$(PROJ_CMP)" -ne "$(FILE)" ]; then \
		printf " $(COLOR_1) [$(RESET)$(PROJ_CMP)$(COLOR_1)/$(RESET)$(FILE)$(COLOR_1)]\t$(RESET)$<                     \r"; \
	else \
		printf " $(COLOR_1) [$(RESET)$(PROJ_CMP)$(COLOR_1)/$(RESET)$(FILE)$(COLOR_1)]\t$(RESET)$<                 \n\n"; \
	fi
	@$(eval PROJ_CMP=$(shell echo $$(($(PROJ_CMP)+1))))

$(NAME): $(LIBFT_NAME) $(OBJS)
	@ar rcs $(NAME) $(LIBFT_NAME) $(OBJS)
	@printf "  ✅ $(COLOR_2)$(NAME) successfully compiled$(RESET)\n"
	@printf "  🔄 $(COLOR_3)$(NAME) is ready to run$(RESET) \n\n"

$(LIBFT_NAME):
		@printf "  📖 $(COLOR_3)Compiling $(LIBFT_NAME)$(RESET) 📖\n"
		@make -C $(LIBFT_DIR) -j --no-print-directory
		@printf "  🖥️  $(COLOR_3)Compiling $(NAME) $(RESET) 🖥️\n"
		
clean:
	@printf "  👾 \033[1;4;38;5;240m$(NAME)$(RESET)   \n  $(COLOR_3)└──> 🗑️    \033[1;38;5;255m.o \033[1;38;5;248mhave been deleted$(RESET)\n"	
	$(RM) $(OBJS_DIR)

fclean: clean
	$(RM) $(NAME)
	@printf "  $(COLOR_3)└──> 🗑️    \033[1;38;5;255m$(NAME) binary \033[1;38;5;248mhas been deleted$(RESET)\n\n"
	@make fclean -C $(LIBFT_DIR) --no-print-directory -j

clear:
	@clear

re:	clear fclean all

.PHONY:	re fclean all clean
