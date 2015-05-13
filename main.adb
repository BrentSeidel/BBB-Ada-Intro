with Ada.Text_IO;
--with ada.Sequential_IO;

procedure main is
   led_usr0_name : constant string := "/sys/class/leds/beaglebone:green:usr0/brightness";
   led_usr1_name : constant string := "/sys/class/leds/beaglebone:green:usr1/brightness";
   led_usr2_name : constant string := "/sys/class/leds/beaglebone:green:usr2/brightness";
   led_usr3_name : constant string := "/sys/class/leds/beaglebone:green:usr3/brightness";
   usr0 : Ada.Text_IO.File_Type;
   usr1 : Ada.Text_IO.File_Type;
   usr2 : Ada.Text_IO.File_Type;
   usr3 : Ada.Text_IO.File_Type;

begin
   Ada.Text_IO.Open(usr0, Ada.Text_IO.Out_File, led_usr0_name);
   Ada.Text_IO.Open(usr1, Ada.Text_IO.Out_File, led_usr1_name);
   Ada.Text_IO.Open(usr2, Ada.Text_IO.Out_File, led_usr2_name);
   Ada.Text_IO.Open(usr3, Ada.Text_IO.Out_File, led_usr3_name);
   ada.text_io.put_line("Hello world!");
   for x in 1 ..20 loop
      Ada.Text_IO.Put_Line("Lights on");
      Ada.Text_IO.Put(usr0, "1");
      Ada.Text_IO.Flush(usr0);
      Ada.Text_IO.Put(usr1, "1");
      Ada.Text_IO.Flush(usr1);
      Ada.Text_IO.Put(usr2, "1");
      Ada.Text_IO.Flush(usr2);
      Ada.Text_IO.Put(usr3, "1");
      Ada.Text_IO.Flush(usr3);
      delay 0.5;
      Ada.Text_IO.Put_Line("Lights off");
      Ada.Text_IO.Put(usr0, "0");
      Ada.Text_IO.Flush(usr0);
      Ada.Text_IO.Put(usr1, "0");
      Ada.Text_IO.Flush(usr1);
      Ada.Text_IO.Put(usr2, "0");
      Ada.Text_IO.Flush(usr2);
      Ada.Text_IO.Put(usr3, "0");
      Ada.Text_IO.Flush(usr3);
      delay 0.5;
   end loop;
   Ada.Text_IO.Close(usr0);
   Ada.Text_IO.Close(usr1);
   Ada.Text_IO.Close(usr2);
   Ada.Text_IO.Close(usr3);
   Ada.Text_IO.Put_Line("All done now...");
end main;
