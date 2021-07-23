# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
pw = BCrypt::Password.create('prueba')
admin = Administrator.new(username: "test1", password_digest: pw)
admin.save

admin2 = Administrator.new(username: "test2", password_digest: pw)
admin2.save
