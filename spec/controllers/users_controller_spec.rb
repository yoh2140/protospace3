require 'rails_helper'

describe UsersController do
  let(:user) { create(:user) }
  let(:params) {{
    id: user.id,
    user: attributes_for(:user, username: 'aaaaaa')
    }}

  context 'ユーザーはログインされている。' do
    before { login_user }

    describe 'PATCH #update' do
      before { patch :update, params }
      it '@userは正常に割り当てられています。' do
        expect(assigns(:user)).to eq user
      end
      it '更新が完了しました。' do
        user.reload
        expect(user.username).to eq 'aaaaaa'
      end
      it 'トップページにリダイレクトしました。' do
        expect(response).to redirect_to root_path
      end
      it '更新成功メッセージが表示されました。' do
        expect(flash[:notice]).to eq '変更が完了しました。'
      end
    end

    describe 'GET#edit' do
      before { get :edit, id: user }
      it '@userは正常に割り当てられています。' do
        expect(assigns(:user)).to eq user
      end
      it 'editテンプレートを表示できました。' do
        expect(response).to render_template :edit
      end
    end

    describe 'GET#show' do
      before { get :show, id: user }
      it '@userは正常に割り当てられています。' do
        expect(assigns(:user)).to eq user
      end
      it 'showテンプレートを表示できました。' do
        expect(response).to render_template :show
      end
    end

  end
end
