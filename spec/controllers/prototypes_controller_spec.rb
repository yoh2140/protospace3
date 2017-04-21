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

    describe 'GET#show' do
      before { get :show, id: prototype }
      it "showテンプレートに遷移できました。" do
        expect(response).to render_template :show
      end
      it "@prototypesは正常に割り当てられています。" do
        expect(assigns(:prototype)).to eq prototype
      end
      it "@commentは正常に割り当てられています。" do
        expect(assigns(:comment)).to be_a_new(Comment)
      end
    end

    describe 'GET #edit' do
      before { get :edit, id: prototype }
      it "@prototypeは正常に割り当てられています。" do
        expect(assigns(:prototype)).to eq prototype
      end
      it "editテンプレートを表示できました。" do
        expect(response).to render_template :edit
      end
    end

    describe 'PATCH #update' do
      context '成功した場合' do
        before { patch :update, params }
        it '@prototypesは正常に割り当てられています。' do
          expect(assigns(:prototype)).to eq prototype
        end
        it '記事を更新しました。' do
          prototype.reload
          expect(prototype.title).to eq "aaaaaa"
        end
        it '詳細ページにリダイレクトしました。' do
          expect(response).to redirect_to prototype_path(prototype)
        end
        it '更新成功メッセージが表示されました。' do
          expect(flash[:success]).to eq '更新できました。'
        end
      end
      context '失敗した場合' do
        before { patch :update, invalid_params }
        it '@prototypesは正常に割り当てられていません。' do
          expect(assigns(:prototype)).to eq prototype
        end
        it '記事を更新できませんでした。' do
          prototype.reload
          expect(prototype.title).not_to eq "aaaaaa"
        end
        it '編集ページにリダイレクトしました。' do
          expect(response).to render_template :edit
        end
        it '更新成功メッセージが表示されました。' do
          expect(flash[:danger]).to eq '更新が失敗しました。'
        end
      end
    end

    describe 'DELETE #destroy' do
      it '@prototypeは正常に割り当てられています。' do
        delete :destroy, id: prototype
        expect(assigns(:prototype)).to eq prototype
      end
      it '記事を正常に削除できました。' do
        expect{ delete :destroy, id: prototype }.to change(Prototype, :count).by(-1)
      end
      it 'トップページにリダイレクトしました。' do
        delete :destroy, id: prototype
        expect(assigns(:prototype)).to redirect_to root_path
      end
      it '削除メッセージが表示されました。' do
        delete :destroy, id: prototype
        expect(flash[:success]).to eq '削除が完了しました。'
      end
    end

  end
end
