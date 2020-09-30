require 'rails_helper'

RSpec.describe "StaticPages", type: :request do
  context 'GET #home' do
    before { get root_path }
    it "homeへアクセス" do
      expect(response).to have_http_status(200)
    end
    it "タイトルは「育児Q&A」か" do
      expect(response.body).to include "育児Q&A"
    end
  end

  context 'GET #help' do
    before { get help_path }
    it "helpへアクセス" do
      expect(response).to have_http_status(200)
    end
    it "タイトルは「育児Q&A」か" do
      expect(response.body).to include "育児Q&A"
    end
  end

  context 'GET #about' do
    before { get about_path }
    it "aboutへアクセス" do
      expect(response).to have_http_status(200)
    end
    it "タイトルは「育児Q&A」か" do
      expect(response.body).to include "育児Q&A"
    end
  end
end
