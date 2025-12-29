import std.stdio;
import std.parallelism;
import std.datetime.stopwatch;

long fib(long n) {
    if (n < 2) return n;
    return fib(n - 1) + fib(n - 2);
}

void main() {
    long n = 40;
    
    writeln("Начинаем вычисления для n = ", n);
    auto sw = StopWatch(AutoStart.yes);

    auto fibTask = task!fib(n - 1); 
    fibTask.executeInNewThread();

    long result2 = fib(n - 2);
    long result1 = fibTask.yieldForce();

    long finalResult = result1 + result2;
    sw.stop();

    writefln("Результат: %d", finalResult);
    writefln("Время выполнения: %s мс", sw.peek.total!"msecs");
}