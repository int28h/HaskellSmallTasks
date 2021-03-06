{-
Реализация функции для вычисления числа Фибоначчи, основанная на прямом рекурсивном определении, крайне неэффективна - 
количество вызовов функции растет экспоненциально с ростом значения аргумента. 
GHCi позволяет отслеживать использование памяти и затраты времени на вычисление выражения, для этого следует 
выполнить команду :set +s:

GHCi> :set +s
GHCi> fibonacci 30
832040
(8.36 secs, 298293400 bytes)

С помощью механизма аккумуляторов попробуйте написать более эффективную реализацию, имеющую линейную сложность 
(по числу рекурсивных вызовов). Как и в предыдущем задании, функция должна быть определена для всех целых чисел.
-}
fibonacci :: Integer -> Integer
fibonacci n = helper 0 1 n

helper :: Integer -> Integer -> Integer -> Integer
helper acc1 acc2 n  | n == 0 = acc1
                    | n > 0 = helper (acc1 + acc2) acc1 (n - 1)
                    | n < 0 = helper acc2 (acc1 - acc2) (n + 1)