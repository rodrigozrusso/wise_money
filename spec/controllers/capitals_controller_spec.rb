require 'spec_helper'

describe CapitalsController do

  let(:valid_attributes) { { "name" => "MyString" } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all capitals as @capitals" do
      capital = Capital.create! valid_attributes
      get :index, {}, valid_session
      assigns(:capitals).should eq([capital])
    end
  end

  describe "GET show" do
    it "assigns the requested capital as @capital" do
      capital = Capital.create! valid_attributes
      get :show, {:id => capital.to_param}, valid_session
      assigns(:capital).should eq(capital)
    end
  end

  describe "GET new" do
    it "assigns a new capital as @capital" do
      get :new, {}, valid_session
      assigns(:capital).should be_a_new(Capital)
    end
  end

  describe "GET edit" do
    it "assigns the requested capital as @capital" do
      capital = Capital.create! valid_attributes
      get :edit, {:id => capital.to_param}, valid_session
      assigns(:capital).should eq(capital)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Capital" do
        expect {
          post :create, {:capital => valid_attributes}, valid_session
        }.to change(Capital, :count).by(1)
      end

      it "assigns a newly created capital as @capital" do
        post :create, {:capital => valid_attributes}, valid_session
        assigns(:capital).should be_a(Capital)
        assigns(:capital).should be_persisted
      end

      it "redirects to the created capital" do
        post :create, {:capital => valid_attributes}, valid_session
        response.should redirect_to(Capital.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved capital as @capital" do
        Capital.any_instance.stub(:save).and_return(false)
        post :create, {:capital => { "name" => "invalid value" }}, valid_session
        assigns(:capital).should be_a_new(Capital)
      end

      it "re-renders the 'new' template" do
        Capital.any_instance.stub(:save).and_return(false)
        post :create, {:capital => { "name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested capital" do
        capital = Capital.create! valid_attributes
        Capital.any_instance.should_receive(:update).with({ "name" => "MyString" })
        put :update, {:id => capital.to_param, :capital => { "name" => "MyString" }}, valid_session
      end

      it "assigns the requested capital as @capital" do
        capital = Capital.create! valid_attributes
        put :update, {:id => capital.to_param, :capital => valid_attributes}, valid_session
        assigns(:capital).should eq(capital)
      end

      it "redirects to the capital" do
        capital = Capital.create! valid_attributes
        put :update, {:id => capital.to_param, :capital => valid_attributes}, valid_session
        response.should redirect_to(capital)
      end
    end

    describe "with invalid params" do
      it "assigns the capital as @capital" do
        capital = Capital.create! valid_attributes
        Capital.any_instance.stub(:save).and_return(false)
        put :update, {:id => capital.to_param, :capital => { "name" => "invalid value" }}, valid_session
        assigns(:capital).should eq(capital)
      end

      it "re-renders the 'edit' template" do
        capital = Capital.create! valid_attributes
        Capital.any_instance.stub(:save).and_return(false)
        put :update, {:id => capital.to_param, :capital => { "name" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested capital" do
      capital = Capital.create! valid_attributes
      expect {
        delete :destroy, {:id => capital.to_param}, valid_session
      }.to change(Capital, :count).by(-1)
    end

    it "redirects to the capitals list" do
      capital = Capital.create! valid_attributes
      delete :destroy, {:id => capital.to_param}, valid_session
      response.should redirect_to(capitals_url)
    end
  end

end
