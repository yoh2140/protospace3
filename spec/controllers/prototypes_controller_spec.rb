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


end
