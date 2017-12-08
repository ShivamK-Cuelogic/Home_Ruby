require_relative 'Login'
require_relative 'Validation'
require_relative 'Login'
require 'csv'
class Profile
  include Validation

  def dispOptions
    @user=Login.whoLoggedIn
    puts "********** Profile Page ***********"
    puts "\nWelcome ,"+@user
    puts "1.Deposit\n2.Withdraw\n3.Transfer\n4.View Balance\n5.Exit\nEnter your choice\n"
    option=gets
    return option
  end
  def deposit
    valid=false
    while(valid==false)
      puts "Enter recievers account number\n"
      rec_acc_no=Integer(gets)
      if Validation.alreadyExists?(rec_acc_no,'acc_no')==false
        puts "Account does not exist.."
        valid=false
        next
      end
      valid=true
    end
    valid=false
    while (valid==false)
      puts "Enter amount\n"
      amount=Integer(gets)
      if Validation.checkBalance(@user,amount)==false
        puts "You dont have sufficient balance\n"
        valid=false
        next
      end
      valid=true
    end
   # valid=false
    #while(valid==false)
     # puts "Enter your password to send money"
      #password=gets
     # if Validation.checkUserPassword(@user,password)==true


      #end
    #end
  end
  def withdraw
    valid=false
    while (valid==false)
      puts "Enter amount\n"
      amount=Integer(gets)
      if Validation.checkBalance(@user,amount)==false
        puts "You dont have sufficient balance\n"
        valid=false
        next
      else
        all_records = CSV.read('/home/shivam/RubymineProjects/Final_Assignment/DataFiles/Details.csv', :headers=>true)
        puts all_records
      end
      valid=true
    end
  end
end

