require 'rails_helper'

RSpec.describe User, type: :model do
  context 'Espero validar os campos obrigatorios' do
    it 'Validar o campo nome está presente' do
      user = build(:user)

      expect(user.valid?).to eq(true)
      #expect(user).to be_truthy
    end

    it 'Validar o campo nome como nil' do
      user = build(:user, name: nil)

      expect(user.valid?).to eq(false)
      #expect(user).to be_falsey
    end

    it 'Validar o campo telefone como nil' do
      user = build(:user, phone: nil)

      expect(user.valid?).to eq(false)
    end

    it 'Validar o campo email como nil' do
      user = build(:user, email: nil)

      expect(user.valid?).to eq(false)                      
    end

    it 'Validar o campo senha como nil' do
      user = build(:user, password: nil)

      expect(user.valid?).to eq(false)                      
    end

    context 'Valida email' do
      it 'Validar emails únicos' do
        user1 = create(:user) #user email: user1@gmail.com
        user2 = build(:user, email: user1.email) # user1@gmail.com
  
        expect(user2.valid?).to eq(false)
      end

      it 'Validar mensagem de erro para emails únicos' do
        user1 = create(:user)
        user2 = build(:user, email: user1.email)

        user2.save

        expect(user2.errors.present?).to eq(true)
        #expect(user2.erros.size).to be_positive
      end
    end

  end
end