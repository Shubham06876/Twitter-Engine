defmodule Project4 do
	  [num_user, num_msg] = System.argv
	  #extracted arguments from commandline
	  num_user = String.to_integer(num_user)
	  num_msg = String.to_integer(num_msg)
	  perform_operation = "login"
	  Project4.main(num_user, num_msg, perform_operation)
	  
	  # IO.puts("Start1")
end
