NAME        =   pipex

BONUS       =   pipex_bonus

CC          =   cc

FLAG        =   -Wall -Wextra -Werror -g3 

LIBFT_PATH  =   .libft

LIBFT_FILE  =   libft.a

LIBFT_LIB   =   $(LIBFT_PATH)/$(LIBFT_FILE)

C_FILE      =  	main.c \
				srcs/utils_bis.c \
				srcs/utils.c \

BONUS_FILE  =  	srcs/main_bonus.c \
				srcs/utils_bis.c \
				srcs/utils.c \

OBJS        =   $(C_FILE:.c=.o)

OBJS_BONUS  =   $(BONUS_FILE:.c=.o)

.c.o:
	@printf "\r\033[K[pipex] \033[0;32mBuilding : $<\033[0m"
	@$(CC) $(FLAG) -c $< -o $@

all: $(NAME)

bonus: $(BONUS)

$(LIBFT_LIB):
	@make -C $(LIBFT_PATH)

$(BONUS): $(LIBFT_LIB) $(OBJS_BONUS)
	@printf "\r\033[K[pipex_bonus] \033[0;32mLinking...\033[0m"
	@$(CC) $(OBJS_BONUS) $(LIBFT_LIB) -o $(BONUS) -lm
	@printf "\r\033[K[pipex_bonus] \033[0;32mDone!\033[0m\n"
	
$(NAME): $(LIBFT_LIB) $(OBJS)
	@printf "\r\033[K[pipex] \033[0;32mLinking...\033[0m"
	@$(CC) $(OBJS) $(LIBFT_LIB) -o $(NAME) -lm
	@printf "\r\033[K[pipex] \033[0;32mDone!\033[0m\n"

clean:
	@make clean -sC $(LIBFT_PATH)
	@rm -f $(OBJS)
	@printf "[pipex] \033[1;31mCleaned .o!\033[0m\n"

clean_bonus:
	@make clean -sC $(LIBFT_PATH)
	@rm -f $(OBJS_BONUS) $(OBJS)
	@printf "[pipex_bonus] \033[1;31mCleaned .o bonus!\033[0m\n"

fclean: clean clean_bonus
	@rm -f $(NAME) $(BONUS)
	@make fclean -C $(LIBFT_PATH)
	@printf "[pipex] \033[1;31mCleaned all!\033[0m\n"

re: fclean all

re_bonus: fclean bonus

.PHONY: all bonus clean fclean re clean_bonus re_bonus
