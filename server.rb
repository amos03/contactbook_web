require 'sinatra'
require_relative 'contact'

get "/" do
    redirect to("/home")
end

get "/home" do
    @contacts = Contact.all
    erb :home
end

get "/about" do
    erb :about
end

get "/create_contact_form"
    erb :create_contact_form
end

get "/update_contact_form/:id" do
    @contact = Contact.find(params[:id])
    erb :update_contact_form
end

post "/update_contact_form/:id" do
    update_contact = Contact.find(params[:id])
    update_contact.first_name=params[:first_name]
    update_contact.last_name=params[:last_name]
    update_contact.email=params[:email]
    update_contact.note=params[:note]
    update_contact.save
    redirect to("/home")
end

post "/create_contact" do
    new_contact = Contact.new
    new_contact.first_name=params[:first_name]
    new_contact.last_name=params[:last_name]
    new_contact.email=params[:email]
    new_contact.note=params[:note]
    new_contact.save
end

get "/delete_contact/:id" do
    delete_contact = Contact.find(params[:id])
    delete_contact.delete
    redirect to("/home")
end
