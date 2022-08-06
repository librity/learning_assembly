/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   putchars.c                                         :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lpaulo-m <lpaulo-m@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/05 23:20:43 by lpaulo-m          #+#    #+#             */
/*   Updated: 2022/08/05 23:30:16 by lpaulo-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// gcc -S putchars.c

#include <unistd.h>

static void	putchars(char *str)
{
	while (*str)
		write(STDOUT_FILENO, str++, 1);
}

int	main(void)
{
	putchars("HELLO IN ASSEMBLY!");
	return (0);
}
