require 'spec_helper'

describe TransactionsController do

  let(:valid_attributes) { { "description" => "MyString", status: 1 } }

  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all transactions as @transactions" do
      transaction = Transaction.create! valid_attributes
      get :index, {}, valid_session
      assigns(:transactions).should eq([transaction])
    end
  end

  describe "GET show" do
    it "assigns the requested transaction as @transaction" do
      transaction = Transaction.create! valid_attributes
      get :show, {:id => transaction.to_param}, valid_session
      assigns(:transaction).should eq(transaction)
    end
  end

  describe "GET new" do
    it "assigns a new transaction as @transaction" do
      get :new, {}, valid_session
      assigns(:transaction).should be_a_new(Transaction)
    end
  end

  describe "GET edit" do
    it "assigns the requested transaction as @transaction" do
      transaction = Transaction.create! valid_attributes
      get :edit, {:id => transaction.to_param}, valid_session
      assigns(:transaction).should eq(transaction)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Transaction" do
        expect {
          post :create, {:transaction => valid_attributes}, valid_session
        }.to change(Transaction, :count).by(1)
      end

      it "assigns a newly created transaction as @transaction" do
        post :create, {:transaction => valid_attributes}, valid_session
        assigns(:transaction).should be_a(Transaction)
        assigns(:transaction).should be_persisted
      end

      it "redirects to the created transaction" do
        post :create, {:transaction => valid_attributes}, valid_session
        response.should redirect_to(Transaction.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved transaction as @transaction" do
        Transaction.any_instance.stub(:save).and_return(false)
        post :create, {:transaction => { "description" => "invalid value" }}, valid_session
        assigns(:transaction).should be_a_new(Transaction)
      end

      it "re-renders the 'new' template" do
        Transaction.any_instance.stub(:save).and_return(false)
        post :create, {:transaction => { "description" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested transaction" do
        transaction = Transaction.create! valid_attributes
        Transaction.any_instance.should_receive(:update).with({ "description" => "MyString" })
        put :update, {:id => transaction.to_param, :transaction => { "description" => "MyString" }}, valid_session
      end

      it "assigns the requested transaction as @transaction" do
        transaction = Transaction.create! valid_attributes
        put :update, {:id => transaction.to_param, :transaction => valid_attributes}, valid_session
        assigns(:transaction).should eq(transaction)
      end

      it "redirects to the transaction" do
        transaction = Transaction.create! valid_attributes
        put :update, {:id => transaction.to_param, :transaction => valid_attributes}, valid_session
        response.should redirect_to(transaction)
      end
    end

    describe "with invalid params" do
      it "assigns the transaction as @transaction" do
        transaction = Transaction.create! valid_attributes
        Transaction.any_instance.stub(:save).and_return(false)
        put :update, {:id => transaction.to_param, :transaction => { "description" => "invalid value" }}, valid_session
        assigns(:transaction).should eq(transaction)
      end

      it "re-renders the 'edit' template" do
        transaction = Transaction.create! valid_attributes
        Transaction.any_instance.stub(:save).and_return(false)
        put :update, {:id => transaction.to_param, :transaction => { "description" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested transaction" do
      transaction = Transaction.create! valid_attributes
      expect {
        delete :destroy, {:id => transaction.to_param}, valid_session
      }.to change(Transaction, :count).by(-1)
    end

    it "redirects to the transactions list" do
      transaction = Transaction.create! valid_attributes
      delete :destroy, {:id => transaction.to_param}, valid_session
      response.should redirect_to(transactions_url)
    end
  end

end
