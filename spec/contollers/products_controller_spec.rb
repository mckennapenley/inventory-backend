require 'rails_helper'

RSpec.describe ProductsController, :type => :controller do
  describe "GET index" do
    context "when there is no filtering" do
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

      it 'returns all products' do
        get :index
        assigns(:products).should match_array([product, product2])
      end
    end

    context "when filtering by a tag category" do
      let!(:product) do
        FactoryGirl.create(:product)
      end

      let!(:product2) do
        FactoryGirl.create(:product)
      end

      let!(:product3) do
        FactoryGirl.create(:product)
      end

      let!(:tag) do
        FactoryGirl.create(:tag, category: "category")
      end

      let!(:not_filtered_tag) do
        FactoryGirl.create(:tag, category: "second_category")
      end

      let!(:params) do
        {
          tag: "category"
        }
      end

      before do
        product.tags << tag
        product2.tags << not_filtered_tag
      end
    
      it 'returns 200 response' do
        get :index, params: params
        expect(response.status).to eq(200)
      end

      it 'returns products with specific tag' do
        get :index, params: params
        assigns(:products).should match_array([product])
      end
    end
  end

  describe "POST create" do
    let!(:params) do
      {
        "product"=>{
          "title"=>"title",
          "quantity"=>1,
          "tags"=>["Children","Sale"]
        }
      } 
    end

    context 'when params are valid' do
    
      it 'creates the product' do
        expect do
          post :create, params: params
        end.to change { Product.count }.by(1)

        product = Product.last

        expect(product.title).to eq("title")
        expect(product.quantity).to eq(1)
        expect(product.tags.pluck(:category)).to match_array(["Children", "Sale"])
      end

      it 'redirects to root_url' do
        post :create, params: params
        expect(response).to redirect_to(root_url)
      end   
    end
  
    context 'when params are invalid' do
      before do
        expect_any_instance_of(Product).to receive(:save).and_return(false)
      end

      it 'does not creates the product' do
        expect do
          post :create, params: params
        end.to change { Product.count }.by(0)
      end 
      
      it 'renders "new" template' do
        post :create, params: params
        expect(response).to render_template :new
      end   
    end
  end 

  describe 'PATCH update' do
    let!(:product) do
      FactoryGirl.create(:product)
    end
     let!(:params) do
      {
        "id"=>product.id,
        "product"=>{
          "title"=>"updated_title",
          "quantity"=>2,
          "tags"=>["Women"]
        }
      } 
    end
    context 'when params are valid' do
      

      it 'updates the product' do
        expect do
          post :update, params: params
        end.to change { Product.count }.by(0)

        product = Product.last

        expect(product.title).to eq("updated_title")
        expect(product.quantity).to eq(2)
        expect(product.tags.pluck(:category)).to match_array(["Women"])
      end

    it 'redirects to root' do
        post :update, params: params
        expect(response).to redirect_to(root_url)   
    end
    end

    context 'when params are invalid' do
      before do
          expect_any_instance_of(Product).to receive(:update).and_return(false)
        end

      it 'renders "edit" template' do
        post :update, params: params
        expect(response).to render_template :edit
      end 
    end
  end
  
  describe 'DELETE destroy' do
    let!(:product) do
      FactoryGirl.create(:product)
    end
    let!(:params) do
      {
        "id"=>product.id
      } 
    end
    
    it "should delete the product" do
      expect do
        delete :destroy, params: params
      end.to change { Product.count }.by(-1)
    end

    it 'redirects to root' do
      delete :destroy, params: params
      expect(response).to redirect_to(root_url)
    end
  end
end
