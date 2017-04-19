require 'rails_helper'

RSpec.describe IdeasController, type: :controller do

  describe "#new" do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new Idea instance variable' do
      get :new
      expect(assigns(:idea)).to be_a_new(Idea)
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      def valid_request
        post :create, params: {
          idea: FactoryGirl.attributes_for(:idea)
        }
      end

      it 'creates a new campaign in the database' do
        count_before = Idea.count
        valid_request
        count_after = Idea.count
        expect(count_after).to eq(count_before + 1)
      end

      it 'redirects to the campaign show page' do
        valid_request
        expect(response).to redirect_to(ideas_path)
      end
    end

    context 'with invalid attributes' do
      def invalid_request
        post :create, params: {
          idea: FactoryGirl.attributes_for(:idea, title: nil)
        }
      end

      it 'doesnt create record in the database' do
        count_before = Idea.count
        invalid_request
        count_after = Idea.count
        expect(count_before).to eq(count_after)
      end

      it 'renders the new template' do
        invalid_request
        expect(response).to redirect_to(new_idea_path)
      end
    end
  end

end
