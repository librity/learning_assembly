/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   write_str.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: lpaulo-m <lpaulo-m@student.42sp.org.br>    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2022/08/05 23:20:43 by lpaulo-m          #+#    #+#             */
/*   Updated: 2022/08/08 21:38:58 by lpaulo-m         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

// gcc -S write_str.c

#include <unistd.h>

int	main(void)
{
	write(STDOUT_FILENO, "HELLO IN ASSEMBLY!\n", 19);
	return (0);
}
