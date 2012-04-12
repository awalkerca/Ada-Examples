with Ada.Text_IO, Ada.Integer_Text_IO;
use Ada.Text_IO, Ada.Integer_Text_IO;
procedure Sample is
   --Returns the factorial of n: Recursive
   function factorial(n : Positive) return Positive;

   function factorial(n : Positive) return Positive is
   begin
      if n < 2 then
         return 1;
      else
         return n * factorial(n-1);
      end if;
   end;

   -- Simple Tasking example
   procedure Tasking is

      -- define a task, with an entry point.
      -- entry is point of syncronization
      task Task_One is
         entry Print_Stuff;
      end Task_One;

      -- define the body of the task
      -- 'accept' is the implementation of the entry
      task body Task_One is
      begin
         for Index in 1..4 loop
            accept Print_Stuff do
               delay 0.8;
               Put("Task One, iteration #");
               Put(Index,3);
               New_Line;
            end Print_Stuff;
         end loop;
      end Task_One;

      -- define a second task
      task Task_Two;

      -- second task syncronizes with Task 1 on the "Print_Stuff" entry
      task body Task_Two is
      begin
         for Index in 1..5 loop
            Put("Going to call Print Stuff, #");
            Put(Index,3);
            New_Line;
            Task_One.Print_Stuff;
            Put_Line("Finished calling Print_Stuff");
         end loop;
      end Task_Two;
   begin
      Put("I'm the main Procedure.");
      New_Line;
   end;


begin
   Tasking;
   put(factorial(5));
end;
