class ProfilesController < ApplicationController
before_filter :authenticate_user!, :except => [:addinfo]


def show
@user = current_user
@userd = UserImpl.find_by_user_id(@user.id)
#omniauth = request.env['omniauth.auth']
@sss = request.env['omniauth.auth']
end

def addemail
@user = current_user
@userdd = UserImpl.find_by_user_id(@user.id)
@userd = UserImpl.new
end

def addinfo
	ff
@user = current_user
fn = params[:user_impl]['fname']
ln = params[:user_impl]['lname']
params[:user_impl] = {:user_id => @user.id, :fname => fn, :lname => ln}
@userd = UserImpl.create(params[:user_impl])
redirect_to :controller => 'profiles', :action=>'show'
end

def self.convert_currency(from_currency,to_currency)
	response = Nestful.get"http://www.googel.com/ig/calculator", :params=>{ :h=> "eq", :q => "1#{from_currency}=?{to_currency}"}
	r = response.gsub('rhs:','"rhs":').gsub('lhs:','"lhs":').gsub('error:','"error":').gsub('icc:','"icc":')
	return JSON.parse(r)["rhs"].partition("")[0]
end


def self.rate(from_currency, to_currency)
 if from_currency == 'USD' && to_currency = 'ISR'
 	return 50.66
 end
end

def convertcur
end

def fetchcur
	from_currency = params[:cur]['fromcur']
	to_currency = params[:cur]['tocur']
	rum = UserImpl.convert_currency("USD", "INR")
	redirect_to :controller => 'profiles', :action=>'showcurrate', :id =>rum
end

def showcurrate 
@scr = params[:id].to_f
end

end

