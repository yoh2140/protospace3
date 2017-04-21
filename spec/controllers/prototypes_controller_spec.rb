require 'rails_helper'

describe PrototypesController, type: :controller do
  let!(:prototype) { create(:prototype) }
  let(:params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: 'aaaaaa', tag_list: 'bbbbbb')
   }}
   let(:invalid_params) {{
     id: prototype.id,
     prototype: attributes_for(:prototype, title: nil, tag_list: 'bbbbbb')
   }}

  context 'ユーザーはログインされています。' do
    before { login_user }

    describe 'GET #index' do
      before { get :index }
      it "@prototypesは正常に割り当てられています。" do
        expect(assigns(:prototypes)).to include prototype
      end
      it "indexテンプレートに遷移できました。" do
        expect(response).to render_template :index
      end
    end

end
