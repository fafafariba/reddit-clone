require 'rails_helper'
begin
  UsersController
rescue
  UsersController = nil
end

RSpec.describe UsersController, :type => :controller do

  describe "GET #new" do
   it "renders the new template" do
     get :new #, id: id, username: username, etc.
     expect(response).to be_success #order this is first
     expect(response).to render_template(:new)
   end
 end

 describe "POST #create" do
   context "with invalid params" do
     it "validates the presence of the user's username and password" do
       post :create, user: { password: "watermelon" } #nested hash
       expect(response).to render_template(:new)
     end

     it "validates that the password is at least 6 characters long" do
       post :create, user: { username: "barney", password: "is_a"} #nested hash
       expect(response).to render_template(:new)
     end
   end

   context "with valid params" do
     it "redirects user to links index on success" do
       post :create, user: { username: "barney", password: "is_a_dinosaur"}
       expect(response).to redirect_to(subs_url) #Use ActiveRecord to find ods
     end
   end
 end

end
