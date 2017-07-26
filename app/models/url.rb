class Url < ActiveRecord::Base

  validates :long_url, presence: true
  validate :validate_url
  before_create :convert_url

  def convert_url
    # Url.create(long_url: 'http;://...jbsauyb.com')
    self.short_url = shorten_url
  end

  # Genere 6 caracteres al azar para nuestra short url
  def shorten_url
    SecureRandom.urlsafe_base64(4)
  end

  # Vamos a revisar que la URL tenga la forma correcta
  def validate_url
    url = self.long_url
    unless url.start_with?('http://', 'https://') && (url =~ /\A#{URI::regexp}\z/) == 0
      # NO ES CORRECTA
      errors.add(:url, 'Tu URL no es valida')
    end

  end
end
