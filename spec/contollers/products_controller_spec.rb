require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe "GET index" do
    let!(:product) do
      FactoryGirl.create(:product)
    end
    let!(:product2) do
      FactoryGirl.create(:product)
    end

    it 'returns 200 response' do
      get :index
      expect(response.status).to eq(200)
    end
      
  end

  describe "POST create" do
    context 'when params are valid' do
      let!(:valid_params) do
        {
          "product"=>{
            "title"=>"title",
            "quantity"=>1,
            "tags"=>["Children","Sale"]
          }
        } 
      end
    
      it 'creates the product' do
        expect do
          post :create, params: valid_params
        end.to change { Product.count }.by(1)
      end

    it 'redirects to root_url' do
      post :create, params: valid_params
      expect(response).to redirect_to(root_url)
    end
        
    end
  
    context 'when params are invalid' do
        let!(:invalid_params) do
          {
            "product"=>{
              "title"=>"",
              "quantity"=>1,
              "tags"=>["Children","Sale"]
            }
          } 
        end

        it 'does not creates the product' do
          expect do
            post :create, params: invalid_params
          end.to change { Product.count }.by(0)
        end 
        
        it 'renders "new" template' do
          post :create, params: invalid_params
          expect(response).to render_template :new
        end
   
    end
  end
  
end
