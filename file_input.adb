with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Containers.Vectors;
With Ada.Text_IO.Unbounded_IO;


procedure File_Input is

    F                  : File_Type;
    File_Name          : constant String := "fishlist.txt";
    Practice_File_Name : constant String := "practice.txt";

    package B_Str is new
        Ada.Strings.Bounded.Generic_Bounded_Length (Max => 30);
    use B_Str;

    package String_Vectors is new Ada.Containers.Vectors
       (Natural, Unbounded_String);
    use String_Vectors;
    
    V : Vector;
begin
    Create (F, Out_File, Practice_File_Name);
    Put_Line (F, "Hello World #1");
    Reset (F);
    Put_Line (F, "Hello World #2");
    Close (F);

    Open (F, In_File, File_Name);
    while not End_Of_File (F) loop
        B_Str  := Get_Line (B_Str);
        Put_Line (B_Str );
        V.Append(B_Str );
    end loop;
    Close (F);
end File_Input;
