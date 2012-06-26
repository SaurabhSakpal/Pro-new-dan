class ProfilesController < ApplicationController
before_filter :authenticate_user!, :except => [:addinfo]


def show
@user = current_user
@userd = UserImpl.find_by_user_id(@user.id)
end

def addemail
@user = current_user
@userdd = UserImpl.find_by_user_id(@user.id)
@userd = UserImpl.new
end

def addinfo
@user = current_user
fn = params[:user_impl]['fname']
ln = params[:user_impl]['lname']
params[:user_impl] = {:user_id => @user.id, :fname => fn, :lname => ln}
@userd = UserImpl.create(params[:user_impl])
redirect_to :controller => :'profiles', :action=>'show'
end


end

