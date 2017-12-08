require_relative 'WelcomePage'
require_relative 'Login'
require_relative 'Profile'
require_relative 'Registration'
welcomePageObj=WelcomePage.new
ch=welcomePageObj.dispWelcomePage
while ch!=3
  if ch==2
      registrationObj=Registration.new
      if registrationObj.getData==true
        registrationObj.writeIntoFile
        ch=welcomePageObj.dispWelcomePage
        next
      end
  elsif ch==1
    loginObj=Login.new
    if loginObj.dispLoginPage=="Login"
      if loginObj.checkLogin==true
        profileobj=Profile.new
        if profileobj.dispOptions.to_i==1
          profileobj.deposit
        elsif profileobj.withdraw.to_i==2
          profileobj.withdraw
        end
      else
        puts "Incorrect username or password"
      end
    else
      ch=welcomePageObj.dispWelcomePage
      next
    end
  end
end

