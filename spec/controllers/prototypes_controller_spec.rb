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

    describe 'GET #new' do
      before { get :new }
      it "@prototypeは正常に割り当てられています。" do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end
      it "newテンプレートに遷移できました。" do
        expect(response).to render_template :new
      end
    end

    describe 'POST#create' do
      context '成功した場合' do
        before { post :create, params }
        it '新しい情報をデータベースに保存できました。' do
          expect{ post :create, params }.to change(Prototype, :count).by(1)
        end
        it 'トップにリダイレクトしました。' do
          expect(response).to redirect_to root_path
        end
        it '作成成功メッセージが表示されました。' do
          expect(flash[:success]).to eq '作成できました。'
        end
      end
      context '失敗した場合' do
        before { post :create, invalid_params}
        it '@prototypeに'
        it '情報をデーターベースに保存できませんでした。' do
          expect{ post :create, invalid_params }.not_to change(Prototype, :count)
        end
        it '記事作成ページにリダイレクトしました。' do
          expect(response).to render_template :new
        end
        it '作成失敗メッセージが表示されました。' do
          expect(flash[:danger]).to eq '作成に失敗しました。'
        end
      end
      
    end

end
