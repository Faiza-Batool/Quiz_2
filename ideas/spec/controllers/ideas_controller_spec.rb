require 'rails_helper'

RSpec.describe IdeasController, type: :controller do
    
    describe "#new" do 
        context "with signed in user" do
            before do
                session[:user_id] = FactoryBot.create(:user).id
            end
        
            it "should render the new template" do 

                # WHEN
                get(:new) 
            
                # THEN
                expect(response).to(render_template(:new))  
                
            end
        
            it "should set an instance variable with a new idea" do 

                # WHEN
                get(:new) 

                # THEN
                expect(assigns(:idea)).to(be_a_new(Idea))  
                
            end
        end
    end

    describe "#create" do  
       
        context "with user signed in" do
            
            before do
                session[:user_id] = FactoryBot.create(:user).id
            end

            context "with valid parameters" do 
            
                def valid_request
                    post(:create, params:{ idea: FactoryBot.attributes_for(:idea)})
                end
        
                it "should create an idea in the database" do  
                    # GIVEN
                    count_before = Idea.count   
        
                    # WHEN
                    valid_request
        
                    # THEN
                    count_after = Idea.count
                    expect(count_after).to(eq(count_before + 1))
                end
                
                it "should redirect to the show page for that idea" do
        
                    # WHEN
                    valid_request
        
                    # THEN
                    idea = Idea.last
                    expect(response).to(redirect_to(idea_path(idea.id)))
                end
            end
            
            context "with invalid parameters" do
                def invalid_params
                    post(:create, params:{ idea: FactoryBot.attributes_for(:idea, title: nil)})
                end
                
                it "should not save a record into the database" do
                    # GIVEN
                    count_before = Idea.count
    
                    # WHEN
                    invalid_params
    
                    # THEN
                    count_after = Idea.count
                    expect(count_after).to(eq(count_before)) 
                end
    
                it "should render the new template" do
        
                    # WHEN
                    invalid_params
                    # THEN
                    expect(response).to(render_template(:new)) 
                end
                
            end
        end
        
        context "without user signed in" do
            it "should redirect to the sign in page" do
                post(:create, params:{idea: FactoryBot.attributes_for(:idea)})
                expect(response).to(redirect_to(new_session_path)) 
            end
        end   
          
    end

end
