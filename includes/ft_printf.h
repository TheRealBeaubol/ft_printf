/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_printf.h                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lboiteux <lboiteux@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2023/11/17 21:41:37 by lboiteux          #+#    #+#             */
/*   Updated: 2023/11/22 04:36:32 by lboiteux         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#ifndef FT_PRINTF_H
# define FT_PRINTF_H

# include <stdarg.h>
# include <unistd.h>
# include <stdlib.h>

int		ft_printf(const char *s, ...);
int		ft_printf_putchar(char c);
int		ft_printf_strlen(const char *s);
int		ft_printf_putstr(char *s);
void	ft_ul_nb_base(unsigned long nbr, char *base, int *size, int i);
void	ft_printf_putnbr(int nb, int *size);
void	ft_ui_putnbr_base(unsigned int nb, char *base, int *size);
#endif