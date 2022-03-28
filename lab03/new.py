from lab03 import num_eights
def pingpong(n):
    """Return the nth element of the ping-pong sequence.

    >>> pingpong(8)
    8
    >>> pingpong(10)
    6
    >>> pingpong(15)
    1
    >>> pingpong(21)
    -1
    >>> pingpong(22)
    -2
    >>> pingpong(30)
    -2
    >>> pingpong(68)
    0
    >>> pingpong(69)
    -1
    >>> pingpong(80)
    0
    >>> pingpong(81)
    1
    >>> pingpong(82)
    0
    >>> pingpong(100)
    -6
    """
    # res, index = 1, 1
    # inverse = False
    # while index < n:
    #     index += 1
    #     if not inverse:
    #         res += 1
    #     else:
    #         res -= 1
    #     if num_eights(index) > 0 or index % 8 == 0:
    #         inverse = not inverse
    # return res

    def helper(res, index, direction):

        if index == n:
            return res

        else:
            if num_eights(index) or index % 8 == 0:
                return helper(res - direction, index + 1, -direction)

            else:
                return helper(res + direction, index + 1, direction)

    return helper(1, 1, 1)
